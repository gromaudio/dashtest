import thread, time, string, os, traceback
import Queue
from constants import *


# pymedia specific
try:
  import pymedia.audio.sound as sound
  import pymedia.audio.acodec as acodec
  import pymedia.muxer as muxer
except:
  sound= None
  import pyaudio

# Const
PORT=      4
BAUD=      921600
EMULATION= 0
HOST =     'localhost'
SOCKET=    4567
STATUS_INTERVAL= 0.5
TIMEOUT=   4

BLOCK_BULK_LOG= True

DEFAULT_GROUP= GROUP_PLAYLISTS
# DEFAULT_GROUP= GROUP_ALBUMS
#DEFAULT_GROUP= GROUP_ARTISTS
#DEFAULT_GROUP= GROUP_FAVORITES
#DEFAULT_GROUP= GROUP_NOW_PLAYING;

PROTOCOL_VERSION= 2
AUDIO_MODE= AOA_V1
GROUP_STEP= 1
MIME_TYPE_EXTENSION_MAPPING= { 'audio/mpeg3': 'mp3',
                               'audio/flac': 'flac',
                               'audio/wav': 'wav',
                               'audio/aac': 'aac',
                               'audio/wma': 'wma',
                               'audio/ogg': 'ogg' }

if EMULATION:
  import emulator
  p= emulator.GROMEmulator()
else:
  if SOCKET> 0:
    import socket, os
    # Run adb command to launch aalinq
    os.system( 'adb forward tcp:4567 tcp:4567' )
    os.system( 'adb shell "am start -n com.gromaudio.dashlinq/com.gromaudio.aalinq.AdbAutoRunActivity"' )
    #os.system( 'adb shell "am startservice --user 0 -n com.gromaudio.aalinq/com.gromaudio.aalinq.AALinQService"' )
    #os.system( 'adb shell "am startservice -n com.gromaudio.aalinq.aalinq/com.gromaudio.aalinq.AALinQService"' )

    print "Wait 1 second for  start service."
    import time
    time.sleep(1)

    p = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    p.connect((HOST, SOCKET))
    p.settimeout(TIMEOUT)
  else:
    import serial
    p= serial.Serial( port=PORT, baudrate=BAUD )
    p.setRTS(0)
    p.setDTR(0)

# Variables
POSITION=      0
MAX_VALUE=     0
COUNTER=       0
GROUP_VALUES=  {}
FILE_SIZE=     0
SAMPLE_RATE=   0
CHANNELS=      0
BIT_RATE=      0
STREAM_FORMAT= 0
TRACK=         0
TRACK_MAX=     0
DISK=          0
PLAY=          False
PAUSE=         True
TIME_MS=       0
TIME_MAX=      0
BULK_REQUEST_SENT= False
INPUT_QUEUE=   Queue.Queue()
wf=            None
snd=           None
stream=        None
demuxer=       None

# -------------------------------------------------
def parseInt( data ):
  return ( ord( data[ 0 ] ) << 24 )+ ( ord( data[ 1 ] ) << 16 )+ ( ord( data[ 2 ] ) << 8 )+ ord( data[ 3 ] )

# -------------------------------------------------
def parseIntLE( data ):
  return ( ord( data[ 3 ] ) << 24 )+ ( ord( data[ 2 ] ) << 16 )+ ( ord( data[ 1 ] ) << 8 )+ ord( data[ 0 ] )

# -------------------------------------------------
def parseShort( data ):
  return ( ord( data[ 0 ] ) << 8 )+ ord( data[ 1 ] )

# -------------------------------------------------
def packShort( data ):
  return [ ( data >> 8 ) % 256, data % 256 ]

# -------------------------------------------------
def packInt( data ):
  return [ ( data >> 24 ) % 256, ( data >> 16 ) % 256, ( data >> 8 ) % 256, data % 256 ]

# -------------------------------------------------
def parseString( data ):
  return data[ 1: ord( data[ 0 ] )+ 1 ]

# -------------------------------------------------
def sendProtocolVersion( version ):
  sendResponse( ( MESSAGE_TYPE_CAPABILITIES, CMD_SET_VERSION, version ) )

# -------------------------------------------------
def setAudioMode( audioMode ):
  global AUDIO_MODE

  sendResponse( ( MESSAGE_TYPE_CAPABILITIES, CMD_SET_AUDIO_MODE, audioMode ) )
  resp= waitForPacket( ( MESSAGE_TYPE_CAPABILITIES, CMD_ACK) )  
  if len( resp )> 5:
    print [ hex(ord(x)) for x in resp ]
    return resp[ 5 ]== '\x00'

  return True

# -------------------------------------------------
def getGroupValuesCount( groupID ):
  sendResponse( ( MESSAGE_TYPE_MEDIA, CMD_GET_GROUP_ITEMS_COUNT, groupID ) )

# -------------------------------------------------
def getGroupValue( groupId ):
  global COUNTER
  sendResponse( [ MESSAGE_TYPE_MEDIA, CMD_GET_GROUP_ITEMS, groupId ]+ packShort( COUNTER )+ packShort( COUNTER+ GROUP_STEP- 1 ) )
  COUNTER+= GROUP_STEP

# -------------------------------------------------
def setDisk( disk ):
  global DISK

  sendResponse( ( MESSAGE_TYPE_MEDIA, CMD_SET_ACTIVE_GROUP_ITEM, DEFAULT_GROUP, 0, disk ) )
  DISK= disk
  sendResponse( ( MESSAGE_TYPE_MEDIA, CMD_GET_TRACK_COUNT ) )

# -------------------------------------------------
def setDisk_enum( group, disk ):
  sendResponse( ( MESSAGE_TYPE_MEDIA, CMD_SET_ACTIVE_GROUP_ITEM, ( group % 0x100 ), ( disk / 0x100 ), ( disk % 0x100 ) ) )
  sendResponse( ( MESSAGE_TYPE_MEDIA, CMD_GET_TRACK_COUNT ) )

# -------------------------------------------------
def getTrackInfo( track ):
  sendResponse( [ MESSAGE_TYPE_MEDIA, CMD_GET_TRACK_INFO ]+ packShort( track ) )

# -------------------------------------------------
def getTrackID3Info( track ):
  sendResponse( [ MESSAGE_TYPE_MEDIA, CMD_GET_TRACK_ID3_INFO ]+ packShort( track ) )

# -------------------------------------------------
def getTrackName( from_idx, to_idx ):
  sendResponse( [ MESSAGE_TYPE_MEDIA, CMD_GET_TRACK_NAME ]+ packShort( from_idx ) + packShort( to_idx ) )

# -------------------------------------------------
def setCurrentTrack( track ):
  sendResponse( [ MESSAGE_TYPE_MEDIA, CMD_SET_CUR_TRACK]+ packShort( track ) )

# -------------------------------------------------
def sendPlaybackControl( control ):
  sendResponse( ( MESSAGE_TYPE_CONTROL, control ) )

# -------------------------------------------------
def setPlaybackEx( state, value ):
  sendResponse( [ MESSAGE_TYPE_CONTROL, state, 0, 4 ]+ packInt( value ) )

# -------------------------------------------------
def getCurrentTrackNumber():
  sendResponse( ( MESSAGE_TYPE_MEDIA, CMD_GET_CUR_TRACK ) )

# -------------------------------------------------
def readChunk( pos, length ):
  global BULK_REQUEST_SENT

  if AUDIO_MODE== AOA_V1:
    sendResponse( [ MESSAGE_TYPE_BULK, CMD_READ_STREAM_DATA ]+ packInt( pos )+ packInt( length ) )
    BULK_REQUEST_SENT= True
    if pos== 0:
      print 'RESETTING STREAM'

# -------------------------------------------------
def performStatusCycle( trackStatus, time, playbackFlags ):
  if PROTOCOL_VERSION> 2:
    # 3 and up
    if PLAY and AUDIO_MODE== AOA_V2:
      sendResponse( [ MESSAGE_TYPE_MEDIA, CMD_SET_TRACK_TIME ]+ packInt( time ) )
    sendResponse( [ MESSAGE_TYPE_MEDIA, CMD_SET_STATUS ]+ [ trackStatus ] + packInt( time ) )
  else:
    sendResponse( [ MESSAGE_TYPE_MEDIA, CMD_STATUS ]+ [ trackStatus ] + packInt( time ) + packShort( playbackFlags ) )
  sendResponse( ( MESSAGE_TYPE_MEDIA, CMD_GET_STATUS ) )

# -------------------------------------------------
def parseTrackCount( message ):
  return parseInt( message[ 4: 8 ] )

# -------------------------------------------------
def parseTrackName( message ):
  if message and len( message ):
    if ord( message[2]) > 2:
      return parseString( message[ 4: ] )
  else:
    return '<empty>'

# -------------------------------------------------
def showGroupValueContents( group, groupNum ):
  sendResponse( ( MESSAGE_TYPE_MEDIA, CMD_SET_ACTIVE_GROUP_ITEM, group, 0, groupNum ) )
  sendResponse( ( MESSAGE_TYPE_MEDIA, CMD_GET_TRACK_COUNT ) )
  trackCount= parseTrackCount( waitForPacket( ( MESSAGE_TYPE_MEDIA, CMD_TRACK_COUNT ) ) )
  # Show all tracks in selected groupnum
  print '%d tracks found on disk %d' % ( trackCount, groupNum )
  
  for track in xrange( trackCount ):
    getTrackName( track, track )
    trackName= parseTrackName( waitForPacket( ( MESSAGE_TYPE_MEDIA, CMD_TRACK_NAME ) ) )
    print 'Track %d is %s' % ( track, trackName )

  sendResponse( ( MESSAGE_TYPE_MEDIA, CMD_SET_ACTIVE_GROUP_ITEM, DEFAULT_GROUP, 0, DISK ) )

# -------------------------------------------------
def sendResponse( mess ):
  # Calc the check sum
  fullMessage= chr( mess[ 0 ] )+ '\x00'+ chr( len( mess )- 1 )
  for x in mess[ 1: ]:
    fullMessage+= chr( x )
 
  if BLOCK_BULK_LOG== False or ( BLOCK_BULK_LOG== True and mess[ 0 ]!= MESSAGE_TYPE_BULK ):
    s= 'W ' + string.join( [ '%c%c' % ( HEX_TAB[ ord(b) >> 4 ], HEX_TAB[ ord(b) & 15 ] ) for b in fullMessage ], ' ' )
    open( 'log.dat', 'at' ).write( s+ '\n' )

  if SOCKET:
    p.sendall( fullMessage )
  else:
    p.write( fullMessage )

# -------------------------------------------------
def readData( p ):
  while 1:
    command= p.recv(1)
    if len( command )> 0 and ord( command[ 0 ] ) in ( MESSAGE_TYPE_CONTROL, MESSAGE_TYPE_MEDIA, MESSAGE_TYPE_BULK, MESSAGE_TYPE_CAPABILITIES ):
      length= p.recv(2)
      message= command+ length+ p.recv( parseShort( length ) )
      if len( message )> 0:
        if BLOCK_BULK_LOG== False or ( BLOCK_BULK_LOG== True and ord(message[ 0 ])!= MESSAGE_TYPE_BULK ):
          if len( message )> 100:
            s= 'R '+ string.join( [ '%c%c' % ( HEX_TAB[ ord(b) >> 4 ], HEX_TAB[ ord(b) & 15 ] ) for b in message[ :18 ] ], ' ' )
          else:
            s= 'R '+ string.join( [ '%c%c' % ( HEX_TAB[ ord(b) >> 4 ], HEX_TAB[ ord(b) & 15 ] ) for b in message ], ' ' )
          open( 'log.dat', 'at' ).write( s+ '\n' )
        return message

# -------------------------------------------------
def waitForPacket( packetToWait ):
  while 1:
    message= None
    try:
      message= readData( p )
    except socket.timeout:
      print 'Wait for packet timeout'
      return ''
    except:
      traceback.print_exc()
      return ''
      
    if message:
      try:
        packet= parseDeviceMessage( message )
        print 'Waiting', packet, packetToWait
        if packet== packetToWait:
          return message
      except:
        traceback.print_exc()
        return ''
  
# -------------------------------------------------
def waitForBulkCompletion():
  global BULK_REQUEST_SENT, \
         POSITION, \
         TIME_MS, \
         PLAY
         
  if PLAY and BULK_REQUEST_SENT:
    PLAY= False
    print 'waiting for completion'
    waitForPacket( ( MESSAGE_TYPE_BULK, CMD_STREAM_DATA ) )
    BULK_REQUEST_SENT= False
    PLAY= True
    if PROTOCOL_VERSION> 2:
      sendResponse( ( MESSAGE_TYPE_MEDIA, CMD_GET_STATUS ) )

  POSITION= 0
  TIME_MS= 0

# -------------------------------------------------
def refreshGroupValues( groupID ):
  global GROUP_VALUES, \
         COUNTER
  
  getGroupValuesCount( groupID )
  message= waitForPacket( ( MESSAGE_TYPE_MEDIA, CMD_GROUP_ITEMS_COUNT ) )
  maxValue= parseInt( message[ 4: 8 ] )
  print 'Group %d has %d values' % ( groupID, maxValue )
  # Get all group values
  GROUP_VALUES[ groupID ]= []
  COUNTER= 0
  while COUNTER < maxValue:
    getGroupValue( groupID )
    message= waitForPacket( ( MESSAGE_TYPE_MEDIA, CMD_GROUP_ITEMS ) )
    print 'Group %d:%d is %s' % ( groupID, COUNTER- 1, parseString( message[ 4: ] ) )
    GROUP_VALUES[ groupID ].append( parseString( message[ 4: ] ) ) 
  
# -------------------------------------------------
def activateChangedTrack(track):
  global  snd, \
          stream, \
          PLAY, \
          TRACK, \
          demuxer, \
          decoder

  play= PLAY
  PLAY= False
  
  TRACK= track
  # Ask to return track info (streaming type, size, format)
  getTrackInfo( track )
  waitForPacket( ( MESSAGE_TYPE_MEDIA, CMD_TRACK_INFO ) )

  # Reset codec and set up new environment for the stream
  print 'Setting up codec for %s on sample rate %d size %d bitrate %d time %dms' % ( STREAM_FORMAT, SAMPLE_RATE, FILE_SIZE, BIT_RATE, TIME_MAX )
  demuxer= muxer.Demuxer( MIME_TYPE_EXTENSION_MAPPING[ STREAM_FORMAT ] )
  decoder= None
  # Now we have WAV file header, parse it
  if sound:
    snd= sound.Output( SAMPLE_RATE, 2, sound.AFMT_S16_LE )
  else:
    snd = pyaudio.PyAudio()
    stream = snd.open(format=pyaudio.paInt16,
                  channels=2,
                  rate=SAMPLE_RATE,
                  output=True)

  getTrackID3Info( track )
  waitForPacket( ( MESSAGE_TYPE_MEDIA, CMD_TRACK_ID3_INFO ) )
  waitForBulkCompletion()
  if not play:
    sendPlaybackControl( CONTROL_PLAY )

  PLAY= True
  if PROTOCOL_VERSION <= 3 or play:
    readChunk( POSITION, MAX_CHUNK_SIZE )    # Read data file


# -------------------------------------------------
def activateTrack( track ):
  global  snd, \
          stream

  # Ask to return track info (streaming type, size, format)
  if track!= TRACK:
    setCurrentTrack( track )
  
  activateChangedTrack( track )

# -------------------------------------------------
def activateCurrentTrack():
  global  snd, \
          stream

  # Ask to return track info (streaming type, size, format)
  getCurrentTrackNumber()
  mess= waitForPacket( ( MESSAGE_TYPE_MEDIA, CMD_CUR_TRACK ) )
  track= parseInt( mess[ 4:8 ] )
  activateChangedTrack( track )

# -------------------------------------------------
def HTCDesireCrash( track ):
  global POSITION, \
        TIME_MS 

  POSITION = 0
  TIME_MS = 0
  sendPlaybackControl( CONTROL_PLAY )
  setCurrentTrack( track )
  getTrackInfo( track )
  message= readData( p )
  getTrackID3Info( track )
  message= readData( p )
  sendPlaybackControl( CONTROL_PLAY )
  setCurrentTrack( track )
  getTrackInfo( track )
  message= readData( p )
  getTrackID3Info( track )
  message= readData( p )
  sendPlaybackControl( CONTROL_PLAY )

# -------------------------------------------------
def parseDeviceMessage( message ):
  global DISK, \
         RND, \
         RPT, \
         TRACK, \
         POSITION, \
         TIME_MS, \
         FILE_SIZE, \
         SAMPLE_RATE, \
         CHANNELS, \
         BIT_RATE, \
         STREAM_FORMAT, \
         TIME_MAX, \
         TITLE, \
         ARTIST, \
         ALBUM, \
         PLAY, \
         PAUSE, \
         BULK_REQUEST_SENT, \
         decoder
  
  if len( message )< 4:
    print 'Unknown message. Length ', len( message )
    return None
  
  packet= ( ord( message[ 0 ] ), ord( message[ 3 ] ) )
  if packet[ 0 ]== MESSAGE_TYPE_CONTROL:
    if packet[ 1 ]== CONTROL_RND:
      RND= ord( message[ 4 ] )
      print 'RND ', ord(message[ 4 ])
    elif packet[ 1 ]== CONTROL_RPT:
      RPT= ord( message[ 4 ] )
      print 'RPT ', ord(message[ 4 ])
    elif packet[ 1 ]== CONTROL_PLAY:
      print 'PLAY'
      if not PLAY:
        PLAY= True
        if PAUSE:
          if PROTOCOL_VERSION <= 3:
            readChunk( POSITION, MAX_CHUNK_SIZE )    # Read data file
        else:
          activateCurrentTrack()

        PAUSE= False
      #if not BULK_REQUEST_SENT:
      #   readChunk( POSITION, MAX_CHUNK_SIZE )    # Read data file
    elif packet[ 1 ]== CONTROL_STOP:
      print 'STOP'
      PLAY= False
      PAUSE= False
    elif packet[ 1 ]== CONTROL_NEXT_TRACK:
      print 'Next track'
      INPUT_QUEUE.put( 'NT' ) 
    elif packet[ 1 ]== CONTROL_PREV_TRACK:
      INPUT_QUEUE.put( 'PT' ) 
    elif packet[ 1 ]== CONTROL_PAUSE:
      print 'PAUSE'
      PLAY= False
      PAUSE= True
    elif packet[ 1 ]== CONTROL_TRACK_STATE_CHANGED:
      print 'Track state is: ', ord( message[ 4 ] )
      if ord( message[ 4 ] )== STATUS_PLAY:
        PLAY= True
        PAUSE= False
        if not BULK_REQUEST_SENT:
          readChunk( POSITION, MAX_CHUNK_SIZE )    # Read data file
      elif ord( message[ 4 ] )== STATUS_PAUSED:
        PLAY= False
        PAUSE= True
      elif ord( message[ 4 ] )== STATUS_STOP:
        PLAY= False
        PAUSE= False
        if snd:
          snd.stop()
    elif packet[ 1 ]== CONTROL_TRACK_CHANGED:
      if ord( message[ 2 ] ) > 1:
        print 'Grp %d Item %d, Trk %d Trk All %d, OTG %d' % ( ord(message[ 4 ]), parseShort( message[ 5:7 ] ), parseShort( message[ 7:9 ] ), parseShort( message[ 9:11 ] ), ord(message[ 11 ]) )
        if DISK == parseShort( message[ 5:7 ] ):
          # Selected track is in the active playlist
          track= parseShort( message[ 7:9 ] )
          if PROTOCOL_VERSION> 2 and not PLAY:
            if track== TRACK:
              return packet

          print 'Track is set to', track
        else:
          # Active playlist chaged
          category= ord(message[ 4 ])
          disk= parseShort( message[ 5:7 ] )
          track= parseShort( message[ 7:9 ] )
          if PROTOCOL_VERSION> 2:
            print 'trk old %d trk new %d dsk old %d dsk new %d' % ( TRACK, track, DISK, disk )
            if disk== DISK and track== TRACK and category== DEFAULT_GROUP:
              # ignore track change packet if no real change was done
              return packet

          precedingTracks= parseShort( message[ 9:11 ] )
          
          print 'Disk is being set to', disk
          if DISK!= disk or category!= DEFAULT_CATEGORY:
            setDisk( disk )

          message= waitForPacket( ( MESSAGE_TYPE_MEDIA, CMD_TRACK_COUNT ) )
          TRACK_MAX= parseTrackCount( message )
          
          currTrack= 0
          print 'Current disk %d has %d tracks out of %d preceding tracks' % ( disk, TRACK_MAX, precedingTracks )
          while currTrack < TRACK_MAX:
            getTrackName( currTrack, currTrack )
            reply= waitForPacket( ( MESSAGE_TYPE_MEDIA, CMD_TRACK_NAME ) )
            if ord( reply[2]) > 2:
              print '    Trk_%d: %s' % ( currTrack, parseString( reply[ 4: ] ) )
            else:
              s= string.join( [ '%c%c' % ( HEX_TAB[ ord(b) >> 4 ], HEX_TAB[ ord(b) & 15 ] ) for b in reply ], ' ' )
              print '    Trk_%d: Empty reply( %s )' % ( currTrack + 1, s )
            currTrack += 1          
		  
          if category!= DEFAULT_GROUP:
            print 'Category is not default (%d). Falling back to %d' % ( category, DEFAULT_GROUP )
            DISK= 0
            
          print 'Disk %d has %d files. Track is set to %d' % ( DISK, TRACK_MAX, track )
        
        TRACK= track
        activateTrack( track )
  elif packet[ 0 ]== MESSAGE_TYPE_MEDIA:
    if packet[ 1 ]== CMD_STATUS:
      # todo maybe wrong
      if ( ord( message[ 2 ] ) == 6 ) and ( ( ord( message[ 4 ] ) == STATUS_PLAY ) or ( ord( message[4] ) == STATUS_FF) ):
        # Perform jump
        TIME_MS = parseInt( message[ 5: ] )
        POSITION = ( TIME_MS/1000 ) * ( BIT_RATE / 8 )
        print 'Jump to %dms. Bitrate %d, Dest %d' % ( TIME_MS, BIT_RATE, POSITION )
      elif ord( message[ 2 ] ) == 1:
        # Dummy  status received. Ignore
        pass
      elif ord( message[ 2 ] ) == 8:
        TIME_MS = parseInt( message[ 5: ] )
        POSITION = ( TIME_MS/1000 ) * ( BIT_RATE / 8 )
        flags= 0
        if PROTOCOL_VERSION > 2:
          flags = parseShort( message[ 9: ] )
          RND = flags & 1
          RPT = (flags & 2) >> 1

        print 'Jump to %dms. Bitrate %d, Dest %d, flags %d, RND %d, RPT %d' % ( TIME_MS, BIT_RATE, POSITION, flags, RND, RPT )
    elif packet[ 1 ]== CMD_TRACK_INFO:
      if len( message )> 16:
        FILE_SIZE= parseInt( message[ 4:8 ] )             # If 0- stream type
        SAMPLE_RATE= parseInt( message[ 8:12 ] )          # Sample rate
        CHANNELS= ord( message[ 12 ] )                           # Number of channels
        BIT_RATE= parseInt( message[ 13:17 ] )            # Real/average bitrate
        STREAM_FORMAT= parseString( message[ 17: ] )      # Stream format
        if BIT_RATE<> 0:
          TIME_MAX= 1000 * ( FILE_SIZE / ( BIT_RATE / 8 ) ) # Get the track length in ms
        else:
          TIME_MAX= -1
      # 
      print 'SRATE %d CHAN %d BITRATE %d' % ( SAMPLE_RATE, CHANNELS, BIT_RATE )
    elif packet[ 1 ]== CMD_TRACK_ID3_INFO:
      i= 8
      TITLE= parseString( message[ i: ] )
      i+= len( TITLE )+ 1
      ARTIST= parseString( message[ i: ] )
      i+= len( ARTIST )+ 1
      ALBUM= parseString( message[ i: ] )
      # 
      print TITLE, ARTIST, ALBUM
  elif packet[ 0 ]== MESSAGE_TYPE_BULK:
    # Now demux stream
    if demuxer and len( message )> 4:
      frames= demuxer.parse( message[4:] )
      for frame in frames:
        if not decoder:
          decoder= acodec.Decoder( demuxer.streams[ 0 ] )
        decodedData= decoder.decode( frame[ 1 ] )
        if decodedData:
          if sound:
            snd.play( decodedData.data )
            TIME_MS= int( snd.getPosition()* 1000 )
          else:
            stream.write( decodedData.data )
            TIME_MS+= ( len( message )- 4 )* 1000/ ( SAMPLE_RATE* CHANNELS* 2 )
      
    POSITION+= len( message )- 4
    BULK_REQUEST_SENT= False
    if PLAY:
      readChunk( POSITION, MAX_CHUNK_SIZE )    # Read data file
  
  return packet
  
# -------------------------------------------------
def mainThread( p ):
  global  COUNTER, \
          DISK, \
          TRACK, \
          TRACK_MAX, \
          POSITION, \
          TIME_MS, \
          TIME_MAX, \
          PLAY, \
          RND, \
          RPT, \
          FFW, \
          FRW, \
          snd, \
          stream

  start= 0
  expectedLen= 0
  lastStatus= time.time()
  while 1:
    if not INPUT_QUEUE.empty():
      t= INPUT_QUEUE.get()
      t= t.strip().split()
      if len( t ):
        p.settimeout( TIMEOUT )
        if t[ 0 ]== 'ON':  
          # Ignition is on. Start enumerating
          for groupID in GROUP_IDS:
            getGroupValuesCount( groupID )
            message= readData( p )
            if message:
              maxValue= parseInt( message[ 4: 8 ] )
              print 'Group %d has %d values' % ( groupID, maxValue )
              # Get all group values
              GROUP_VALUES[ groupID ]= []
              COUNTER= 0
              while COUNTER < maxValue:
                getGroupValue( groupID )
                message= readData( p )
                if message:
                  print 'Group %d:%d is %s' % ( groupID, COUNTER- 1, parseString( message[ 4: ] ) )
                  GROUP_VALUES[ groupID ].append( parseString( message[ 4: ] ) ) 
                  # Activate current group and
                  # get all the tracks
                  setDisk_enum( groupID, COUNTER- 1 )
                  message= readData( p )
                  currTrack= 0
                  maxTracks= parseInt( message[ 4 : 8 ] )
                  print '    Num of tracks %d' % ( maxTracks )
                  #while currTrack < maxTracks:
                  #  getTrackName( currTrack, currTrack )
                  #  message= readData( p )
                  #  if ord( message[2]) > 2:
                  #    print '    Trk_%d: %s' % ( currTrack, parseString( message[ 4: ] ) )
                  #  else:
                  #    s= string.join( [ '%c%c' % ( HEX_TAB[ ord(b) >> 4 ], HEX_TAB[ ord(b) & 15 ] ) for b in message ], ' ' )
                  #    print '    Trk_%d: Empty reply( %s )' % ( currTrack + 1, s )
                  #  currTrack += 1

                else:
                  #No responce
                  print 'No response on GET_GROUP_VALUES'
            else:
              # No response 
              print 'No response on GET_GROUP_VALUES_COUNT'
          print 'Done'
        elif t[ 0 ]== 'STRESS' and len( t )== 3:
          groupID= int( t[ 1 ] )
          group= int( t[ 2 ] )
          getGroupValuesCount( groupID )
          message= readData( p )
          if message:
            maxValue= parseInt( message[ 4: 8 ] )
            print 'Group %d has %d values' % ( groupID, maxValue )
            if maxValue> group:
              setDisk_enum( groupID, group )
              message= readData( p )
              currTrack= 0
              maxTracks= parseInt( message[ 4 : 8 ] )
              print '    Num of tracks %d' % ( maxTracks )
              while currTrack < maxTracks:
                getTrackName( currTrack, currTrack )
                message= readData( p )
                currTrack += 1
          print 'Done'
        elif t[ 0 ]== 'TRACK' and len( t )== 2:
          track= int( t[ 1 ] )
          if track >= TRACK_MAX:
            # Reset track if no way we can select it
            track= 0
          print 'Track is set to', track
          if PLAY:
            activateTrack( track )
        elif t[ 0 ]== 'DISK' and len( t )== 2:
          DISK= int( t[ 1 ] )
          track= 0
          print 'Disk is set to', DISK
          if PLAY:
            TRACK_MAX= 0
            # Select the DISK which is not empty
            while TRACK_MAX == 0:
              setDisk( DISK )
              message= waitForPacket( ( MESSAGE_TYPE_MEDIA, CMD_TRACK_COUNT ) )
              TRACK_MAX= parseInt( message[ 4: ] )
              print 'Disk %d has %d files' % ( DISK, TRACK_MAX )
              if TRACK_MAX == 0:
                DISK = [ DISK + 1, 0 ][ DISK == ( len( GROUP_VALUES[ DEFAULT_GROUP ] ) - 1 ) ]

            activateTrack( track )
        elif t[ 0 ]== 'PL':  # Play
          # Set current location and start playing
          setDisk( DISK )
          message= waitForPacket( ( MESSAGE_TYPE_MEDIA, CMD_TRACK_COUNT ) )
          TRACK_MAX= parseInt( message[ 4: ] )
          print 'Disk %d has %d files. Starting %d' % ( DISK, TRACK_MAX, TRACK )
          if TRACK >= TRACK_MAX:
            # Reset track if no way we can select it
            TRACK= 0
          activateTrack( TRACK )
        elif t[ 0 ]== 'DC':  # Emulate desire crash
          HTCDesireCrash( TRACK )
          PLAY= True
          if not BULK_REQUEST_SENT:
            readChunk( POSITION, MAX_CHUNK_SIZE )    # Read data file
        elif t[ 0 ]== 'PA':  # Pause
          if PLAY:
            sendResponse( ( MESSAGE_TYPE_CONTROL, CONTROL_PAUSE ) )
          else:
            sendResponse( ( MESSAGE_TYPE_CONTROL, CONTROL_PLAY ) )
          PLAY^= True
          if PLAY and not BULK_REQUEST_SENT:
            readChunk( POSITION, MAX_CHUNK_SIZE )    # Read data file
        elif t[ 0 ]== 'LST' and len( t )== 2:  # Show playlist content
          showGroupValueContents( DEFAULT_GROUP, int( t[ 1 ] ) )
        elif t[ 0 ]== 'AT':  # Show AllSongs content
          showGroupValueContents( GROUP_ALL_FILES, 0 )
        elif t[ 0 ]== 'ST':  # Stop
          if sound== None:
            if stream != None:
              stream.stop_stream()
              stream.close()
          elif snd != None:
            snd.stop()

          PLAY= False
          sendResponse( ( MESSAGE_TYPE_CONTROL, CONTROL_STOP ) )
          waitForBulkCompletion()
        elif t[ 0 ]== 'NT':  # Next track
          print 'NEXT TRK'
          sendResponse( ( MESSAGE_TYPE_CONTROL, CONTROL_NEXT_TRACK ) )
        elif t[ 0 ]== 'PT':  # Previous track
          sendResponse( ( MESSAGE_TYPE_CONTROL, CONTROL_PREV_TRACK ) )
        elif t[ 0 ]== 'PS':  # Start the same track from beginning
          activateTrack( TRACK )
        elif t[ 0 ]== 'ND':  # Next disk
          if len( GROUP_VALUES )== 0:
            # Get default group data
            refreshGroupValues( DEFAULT_GROUP )

          disk = [ DISK + 1, 0 ][ DISK == len( GROUP_VALUES[ DEFAULT_GROUP ] )- 1 ]
          setDisk( disk )
          message= waitForPacket( ( MESSAGE_TYPE_MEDIA, CMD_TRACK_COUNT ) )
          TRACK_MAX= parseInt( message[ 4: ] )
          print 'Disk %d has %d files' % ( DISK, TRACK_MAX )
          TRACK= -1
          activateTrack( 0 )
        elif t[ 0 ]== 'PD':  # Previous disk
          if len( GROUP_VALUES )== 0:
            # Get default group data
            refreshGroupValues( DEFAULT_GROUP )

          POSITION= 0
          TIME_MS= 0 
          track= 0
          if DISK== 0:
            DISK= len( GROUP_VALUES[ DEFAULT_GROUP ] )- 1
          else:
            DISK = DISK - 1
          setDisk( DISK )
          message= waitForPacket( ( MESSAGE_TYPE_MEDIA, CMD_TRACK_COUNT ) )
          TRACK_MAX= parseInt( message[ 4: ] )
          print 'Disk %d has %d files' % ( DISK, TRACK_MAX )
          TRACK= -1
          activateTrack( track )
        elif t[ 0 ]== 'RND':  # Toggle random
          RND^= 1
          if PROTOCOL_VERSION> 2:
            sendResponse( [ MESSAGE_TYPE_CONTROL, CONTROL_SET_RND ]+ [ RND ] )
          print 'RND', RND
        elif t[ 0 ]== 'RPT':  # Toggle repeat
          RPT^= 1
          if PROTOCOL_VERSION> 2:
            sendResponse( [ MESSAGE_TYPE_CONTROL, CONTROL_SET_RPT ]+ [ RPT ] )
          print 'RPT', RPT
        elif t[ 0 ]== 'FF':  # Toggle fast forward
          FFW^= 1
          if PROTOCOL_VERSION> 2:
            if FFW:
              sendResponse( ( MESSAGE_TYPE_CONTROL, CONTROL_FFW ) )
            else:
              sendResponse( ( MESSAGE_TYPE_CONTROL, CONTROL_PLAY ) )
          print 'FFW', FFW
        elif t[ 0 ]== 'FR':  # Toggle fast rewind
          FRW^= 1
          if PROTOCOL_VERSION> 2:
            if FRW:
              sendResponse( ( MESSAGE_TYPE_CONTROL, CONTROL_FRW ) )
            else:
              sendResponse( ( MESSAGE_TYPE_CONTROL, CONTROL_PLAY ) )
          print 'FRW', FRW
        elif t[ 0 ]== '/':
          sendResponse( ( MESSAGE_TYPE_CONTROL, CONTROL_FORCE_TRACK_CHANGED_STATUS ) )
        else:
          print 'Wrong cmd'
    else:
      # If no messages in the key pool, simply check if any pending statuses from AALinQ
      p.settimeout( 0.004 )
      message= None
      try:
        message= readData( p )
      except socket.timeout:
        pass

      if message:
        parseDeviceMessage( message )
        
      p.settimeout(TIMEOUT)
      if time.time()- lastStatus> STATUS_INTERVAL:
        if PLAY:
          seconds = TIME_MS/1000
          minutes = seconds / 60
          seconds = seconds - 60 * minutes
          print 'Time %02d:%02d' % ( minutes , seconds )

        if FFW:
          trackStatus= STATUS_FF
        elif FRW:
          trackStatus= STATUS_FR
        elif PLAY:
          trackStatus= STATUS_PLAY
        elif PAUSE:
          trackStatus= STATUS_PAUSED
        else:
          trackStatus= STATUS_STOP

        play_flags = ( RPT << RPT_FLAG_POS ) | ( RND << MIX_FLAG_POS )
        performStatusCycle( trackStatus, TIME_MS, play_flags )
        #try:
        #  message= readData( p )
        #  parseDeviceMessage( message )
        #except socket.timeout:
        #  print 'Status timeout...'


        #  Send tick
        #  
        lastStatus= time.time()


# Start read thread
RND=   0
RPT=   0
FFW=   0
FRW=   0
TRACK= 0
DISK=  0
PLAY=  0

sendProtocolVersion( PROTOCOL_VERSION )
if not setAudioMode( AUDIO_MODE ):
  print 'Cannot set audio mode. Fallback to AOA1'
  AUDIO_MODE= AOA_V1

thread.start_new_thread( mainThread, ( p, ) )

setDisk(DISK)
setCurrentTrack(TRACK)
while 1:
  t= raw_input( '>' )
  tt= t.strip().split()
  if len( tt ):
    if tt[ 0 ]== 'q':
#      if wf!= None:
#        wf.close()

      if sound== None:
        if stream != None:
          stream.stop_stream()
          stream.close()
      elif snd != None:
        snd.stop()
      
      break
    else:
      INPUT_QUEUE.put( t )
    
