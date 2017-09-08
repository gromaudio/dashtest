MAX_CHUNK_SIZE=  0x800

GROUP_ALL_FILES= 0x00
GROUP_PLAYLISTS= 0x01
GROUP_ARTISTS=   0x02
GROUP_ALBUMS=    0x03
GROUP_GENRES=    0x04
GROUP_FAVORITES= 0x06
GROUP_NOW_PLAYING= 0x07
GROUP_APPS=      0x10

GROUP_IDS= ( GROUP_ALL_FILES, GROUP_PLAYLISTS, GROUP_ARTISTS, GROUP_ALBUMS, GROUP_GENRES, GROUP_APPS )

MESSAGE_TYPE_CONTROL=      0xC0
MESSAGE_TYPE_MEDIA  =      0x80
MESSAGE_TYPE_BULK  =       0x40
MESSAGE_TYPE_CAPABILITIES= 0x10

CMD_ACK=                   0x00
ERROR_PARAMS_OUT_OF_BOUNDS= 0x80
ERROR_PARAMS_INVALID      = 0x81
ERROR_COMMAND_UNRECOGNIZED= 0x82
ERROR_INTERNAL_ERROR      = 0xEE


# Capabilities
CMD_SET_VERSION=               0x07
CMD_SET_AUDIO_MODE=            0x0B
CMD_GET_ACTIVE_APP_ID=         0x0F    #-- HW asks for active app
CMD_ACTIVE_APP_ID=             0x10    #-- Active app ID returned
CMD_GET_APPS_REGISTERED_COUNT= 0x11    #-- Get number of registered apps
CMD_APPS_REGISTERED_COUNT=     0x12    #-- Return number of apps registered
CMD_GET_APP_INFO=              0x13    #-- Get app info
CMD_APP_INFO=                  0x14    #-- Return app information
CMD_SET_ACTIVE_APP=            0x15    #-- Laucnh and connect to app

# Media
CMD_GET_GROUP_ITEMS_COUNT= 0x01
CMD_GROUP_ITEMS_COUNT=     0x02
CMD_GET_GROUP_ITEMS=       0x03
CMD_GROUP_ITEMS=           0x04
CMD_SET_ACTIVE_GROUP_ITEM= 0x05
CMD_GET_TRACK_COUNT=       0x07
CMD_TRACK_COUNT=           0x08
CMD_GET_TRACK_INFO=        0x09
CMD_TRACK_INFO=            0x0A
CMD_GET_TRACK_ID3_INFO=    0x0B
CMD_TRACK_ID3_INFO=        0x0C
CMD_SET_CUR_TRACK=         0x0D
CMD_GET_CUR_TRACK=         0x0F
CMD_CUR_TRACK=             0x10
CMD_GET_STATUS=            0x11
CMD_STATUS=                0x12
CMD_SET_TRACK_TIME=        0x13
CMD_GET_TRACK_NAME=        0x15
CMD_TRACK_NAME=            0x16
CMD_GET_GROUP_VOCAL=       0x17
CMD_GROUP_VOCAL=           0x18
CMD_SET_STATUS=            0x21

# Control
CONTROL_PLAY=                0x01
CONTROL_PAUSE=               0x03
CONTROL_STOP=                0x05
CONTROL_NEXT_TRACK=          0x07
CONTROL_PREV_TRACK=          0x09
CONTROL_SET_TRACK=           0x0B
CONTROL_FFW=                 0x0D
CONTROL_FRW=                 0x0F
CONTROL_SET_RND=             0x11
CONTROL_RND=                 0x14
CONTROL_SET_RPT=             0x15
CONTROL_RPT=                 0x18
CONTROL_FORCE_TRACK_CHANGED_STATUS=       0x2F
CONTROL_TRACK_CHANGED=       0x30
CONTROL_TRACK_STATE_CHANGED= 0x32

# Bulk
CMD_READ_STREAM_DATA=      0x01
CMD_STREAM_DATA=           0x02

STATUS_STOP               = 0x00
STATUS_PLAY               = 0x01
STATUS_PAUSED             = 0x02
STATUS_FF                 = 0x04
STATUS_FR                 = 0x08
STATUS_POS_CHANGED        = 0x10
STATUS_FILE_END           = 0xFF

AOA_V1=                   0x00
AOA_V2=                   0x01

MIX_FLAG_POS=              0
RPT_FLAG_POS=              1

HEX_TAB=('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F')
