Feature: Local Music Plugin
  You have to place "01 LocalMusicTestSuite" folder into sdcard/Music folder in order to run these tests.
@a
Scenario: Start
  Then I press "closeButton"
  Then I press "button2"

Scenario: Check background text
  Then I press "icon"
  Then I press "leftButtonFirst"
  Then I press "Settings"
  Then I scroll to "Music home folder" text
  Then I press "Music home folder"
  Then I scroll to "Mob" text
  Then I press "Mob"
  Then I press "Select"
  Then I press "leftButtonFirst"
  Then I press "Folders"
  And I see "There are no items found in Folders."
  Then I press "Albums"
  And I see "There are no items found in Albums."
  Then I press "Artists"
  And I see "There are no items found in Artists."
  Then I press "Songs"
  And I see "There are no items found in Songs."
  Then I press "Search"
  And I see "Enter keyword or phrase to search"
  Then I press "Artists"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"  

Scenario: Change "Music home folder" to Music
  Then I press "icon"
  Then I press "leftButtonFirst"
  Then I press "Settings"
  Then I scroll to "Music home folder" text
  Then I press "Music home folder"
  Then I press ".."

  #Then I scroll to "Music" text
  Then I press "Music"
  Then I press "01 LocalMusicTestSuite"
  Then I press "Select"
  Then I scroll up to text "General"
  Then I press "AutoHide Panels"
  Then I press "leftButtonFirst"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"
  
  Then I see "Nickelback - Dark Horse"
  Then I press "Nickelback - Dark Horse"
  Then I see "01 Shakin\' Hands"
  And I see "1/2"
  Then I see "02 S.E.X"
  And I see "2/2"
  Then I scroll up
  Then I press " .. "
    
  Then I press "Taylor Swift - Speak Now"
  Then I see "01 Mine"
  And I see "1/3"
  Then I see "02 Sparks Fly"
  And I see "2/3"
  Then I scroll to "03 Back To December" text
  Then I see "03 Back To December"
  And I see "3/3"
  Then I scroll up
  Then I press " .. "

  Then I scroll to "The Police - Reggatta" text
  Then I press "The Police - Reggatta"
  And I see "01 Message in a Bottle"
  And I see "1/3"
  And I see "02 Reggatta de Blanc"
  And I see "2/3"
  Then I scroll to "03 It\'s Alright for You" text
  And I see "03 It\'s Alright for You"
  And I see "3/3"
  Then I scroll up
  Then I press " .. "
  Then I drag from 50:30 to 50:300 moving with 20 steps

Scenario: Add/delete Playlist from On The Go
  Then I press "icon"
  Then I press "Albums"
  Then I press "Playlists"
  Then I wait for 1 second
  Then I press "On The Go"
  Then I long press "01 Mine"
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "From_On_The_Go"
  # To hide keyboard
  Then I go back
  Then I wait for 2 seconds
  Then I press "Save"
  Then I press "On The Go"
  And I see "From_On_The_Go.m3u"
  Then I press "From_On_The_Go.m3u"
  Then I see "01 Mine"
  Then I go back
  # Delete playlist
  Then I wait for 1 second
  Then I long press "From_On_The_Go.m3u"
  Then I wait for 2 seconds
  Then I swipe to up
  Then I press "Delete"
  Then I wait for 1 second
  Then I don't see "From_On_The_Go.m3u"

Scenario: Jump to Folder from On The Go and Play
  Then I press "icon"
  Then I press "Albums"
  Then I press "Playlists"
  Then I wait for 1 second
  Then I press "On The Go"
  Then I long press "01 Mine" 
  Then I wait for 1 second
  Then I press "Play"
  Then I wait for 1 second
  Then I press "slide_panel_now_playing_title"
  Then I should see text containing "01 Mine"
  Then I should see text containing "Speak Now"
  Then I see "03 Taylor Swift"
  And I see "3:50"
  And I see "2/8"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "actionBackArrow"
  Then I wait for 1 second
  Then I long press "01 Mine"
  Then I wait for 1 second
  Then I press "Jump to Folder"
  Then I wait for 1 second
  And I see "01 Mine"
  And I see "02 Sparks Fly"
  And I see "03 Back To December"
  Then I press " .. "
  Then I wait for 1 second

Scenario: Check for duplicate Playlists
  Then I press "icon"
  Then I wait for 20 seconds
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"
  Then I wait for 1 second
  Then I long press "Nickelback - Dark Horse"
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "Already exist"
  # To hide keyboard
  Then I go back
  Then I wait for 2 seconds
  Then I press "Save"
  Then I wait for 1 second
  Then I long press "Nickelback - Dark Horse"
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "Already exist"
  # To hide keyboard
  Then I go back
  Then I wait for 2 seconds
  Then I press "Save"
  And I see "Playlist exist"
  Then I press "Cancel"
  Then I press "Albums"
  Then I long press "Reggatta"
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "Already exist"
  # To hide keyboard
  Then I go back
  Then I wait for 2 seconds
  Then I press "Save"
  And I see "Playlist exist"
  Then I press "Cancel"
  Then I press "Artists"
  Then I long press "01 Nickelback"
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "Already exist"
  # To hide keyboard
  Then I go back
  Then I wait for 2 seconds
  Then I press "Save"
  And I see "Playlist exist"
  Then I press "Cancel"
  Then I press "Songs"
  Then I long press "01 Mine"
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "Already exist"
  # To hide keyboard
  Then I go back
  Then I wait for 2 seconds
  Then I press "Save"
  And I see "Playlist exist"
  Then I press "Cancel"
  Then I press "Albums"
  Then I press "Playlists"
  Then I long press "Already exist.m3u"
  Then I wait for 2 seconds
  Then I swipe to up
  Then I press "Delete"
  And I don't see "Already exist.m3u"
  Then I press "Folders"
  Then I wait for 1 second
 
Scenario: Check if Albums tab contain items from LocalMusicTestSuite
  Then I press "icon"
  Then I press "Albums"
   
  Then I press "Dark Horse"
  Then I see "01 Shakin\' Hands"
  And I see "02 S.E.X."
  Then I go back

  Then I press "Reggatta"
  Then I see "01 Message in a Bottle"
  And I see "02 Reggatta de Blanc"
  Then I scroll down
  And I see "03 It\'s Alright for You"
  Then I scroll up
  Then I go back

  Then I scroll down
  Then I press "Speak Now"
  Then I see "01 Mine"
  And I see "02 Sparks Fly"
  Then I scroll down
  And I see "03 Back To December"
  Then I scroll up
  Then I go back
   
  Then I scroll up

  Then I press "Playlists"
  Then I press "Folders"

Scenario: Check if Artists tab contain items from LocalMusicTestSuite
  Then I press "icon"
  Then I press "Albums"
  Then I press "Artists"
  
  Then I scroll to "01 Nickelback" text
  Then I see "01 Nickelback"
  Then I press "01 Nickelback"
  And I see "1 album, 2 songs out of 2"
  And I see "2 songs"
  And I see "Dark Horse"
  Then I press "01 Nickelback"

  Then I scroll to "02 The Police" text
  Then I see "02 The Police"
  Then I press "02 The Police"
  And I see "1 album, 3 songs out of 3"
  And I see "3 songs"
  And I see "Reggatta"
  Then I press "02 The Police"

  Then I scroll to "03 Taylor Swift" text
  Then I see "03 Taylor Swift"
  Then I press "03 Taylor Swift"
  And I see "1 album, 3 songs out of 3"
  And I see "3 songs"
  And I see "Speak Now"
  Then I press "03 Taylor Swift"

  Then I drag from 50:30 to 50:300 moving with 20 steps
    
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"

Scenario: Check if Songs tab contain items from LocalMusicTestSuite
  Then I press "icon"
  Then I press "Albums"
  Then I press "Artists"
  When I press "Songs"
  
  Then I see "01 Message in a Bottle"

  Then I scroll to "01 Mine" text
  Then I see "01 Mine"

  Then I scroll to "01 Shakin\' Hands" text
  Then I see "01 Shakin\' Hands"

  Then I scroll to "02 Reggatta de Blanc" text
  Then I see "02 Reggatta de Blanc"

  Then I scroll to "02 S.E.X." text
  Then I see "02 S.E.X."

  Then I scroll to "02 Sparks Fly" text
  Then I see "02 Sparks Fly"

  Then I scroll to "03 Back To December" text
  Then I see "03 Back To December"

  Then I scroll to "03 It\'s Alright for You" text
  Then I see "03 It\'s Alright for You"

  Then I drag from 50:30 to 50:300 moving with 20 steps
   
  Then I press "Artists"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"

Scenario: Check tabs and About
  Then I press "icon"
  Then I press "Albums"
  Then I press "Playlists"
  Then I see "Folders"
  Then I see "Playlists"
  Then I see "Albums"
  Then I see "Artists"
  Then I press "Artists"
  Then I see "Songs"
  Then I see "Search"
  Then I press "Artists"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"
  Then I press "leftButtonFirst"
  Then I press "About"
  Then I see "Local music player for DashLinQ. Plays local tracks, automatic cover art update and voice search."
  And I see "Copyright GROM Audio 2015"

Scenario: Local Music Settings
  Then I press "icon"
  Then I press "leftButtonFirst"
  Then I press "Settings"
  Then I see "General"
  Then I see "Gestures"
  And I see "Learn/reassign which gestures do what. Random, Repeat, browse options, extra menus, equalizer and many more is accessible via gestures !"
  When I press "Gestures"
  Then I see "CHANGEABLE ACTIONS"
  And I see "Show track/station information, file size, bitrate etc"
  And I see "Toggle Random on/off"
  And I see "Return to Library"
  And I see "Next category. Folder, Playlist, Album, Artist"
  Then I scroll to text "Update cover art from internet"
  And I see "Prev category. Folder, Playlist, Album, Artist"
  Then I see "FIXED ACTIONS"
  And I see "Navigation Menu slider"
  And I see "Previous Track/Station"
  And I see "Next Track/Station"
  Then I scroll to text "Update cover art from internet"
  And I see "Show Playing Now tracks/stations"
  And I see "Update cover art from internet"
  Then I press "leftButtonFirst" 
  Then I see "AutoHide Panels"
  And I see "Hide Navigation panels when browsing long lists to free up more space for text data"
  Then I see "Cover art resources"
  And I see "Change order of how cover art is searched"
  Then I scroll to text "Media Rescan"
  When I press "Cover art resources"
  Then I see "Lastfm"
  Then I see "Musicbrainz"
  And I see "Save"
  And I see "Cancel"
  Then I go back
  Then I see "Folders"
  And I see "Music home folder"
  Then I see "Indexing"
  And I see "Media Rescan"

Scenario: Play/Pause Music (Folders tab)
  Then I press "icon"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"
  Then I wait for 1 second
  Then I go back
  Then I press "Nickelback - Dark Horse"
  Then I scroll up
  Then I press "01 Shakin\' Hands"
  Then I go back
  Then I wait for 1 second
  Then I press "slide_panel_now_playing_title"
  Then I should see text containing "01 Shakin\' Hands"
  Then I should see text containing "Dark Horse"
  Then I see "01 Nickelback"
  And I see "3:39"
  And I see "1/2"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing
  Then I press "pause"
  Then I press "actionBackArrow"
  Then I scroll up
 
Scenario: Play/Pause Music - long press (Folders tab)
  Then I press "icon"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"
  Then I go back
  Then I wait for 1 second
  Then I press "Taylor Swift - Speak Now"
  Then I long press "01 Mine"
  Then I press "Play"
  Then I go back
  Then I wait for 1 second
  Then I press "slide_panel_now_playing_title"
  Then I should see text containing "01 Mine"
  Then I should see text containing "Speak Now"
  Then I see "03 Taylor Swift"
  And I see "3:50"
  And I see "1/3"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing
  Then I press "pause"
  Then I press "actionBackArrow"
  Then I scroll up

Scenario: Play/Pause Music (Playlists tab)
  Then I press "icon"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"
  Then I go back
  Then I wait for 1 second
  Then I touch the "Nickelback - Dark Horse" text
  Then I scroll up
  Then I long press "01 Shakin\' Hands"
  Then I wait for 2 seconds
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "Mac"
  # To hide keyboard
  Then I go back
  Then I wait for 1 second
  Then I press "Save"
  Then I press " .. "
  Then I press "Playlists"
  Then I press "Mac.m3u"
  Then I press "01 Shakin\' Hands"
  Then I go back
  Then I wait for 2 seconds
  When I press "slide_panel_now_playing_title"
  Then I see "3:39"
  And I see "1/1"
  And I should see text containing "01 Shakin\' Hands"
  And I see "01 Nickelback"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing
  Then I press "pause"
  Then I go back
  Then I wait for 1 second
  Then I long press "Mac.m3u"
  Then I wait for 3 seconds
  Then I swipe to up
  Then I press "Delete"
  Then I wait for 2 seconds

Scenario: Play/Pause Music - long press (Playlists tab)
  Then I press "icon"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"
  Then I go back
  Then I wait for 1 second
  When I touch the "Taylor Swift - Speak Now" text
  Then I long press "01 Mine"
  Then I press "Add to playlist"
  Then I press "New"
  Then I press "Save"
  Then I press " .. "
  Then I press "Playlists"
  Then I long press "01 Mine.m3u"
  Then I press "Play"
  When I press "slide_panel_now_playing_title"
  Then I see "3:50"
  And I see "1/1"
  And I should see text containing "01 Mine"
  And I should see text containing "Speak Now"
  And I see "03 Taylor Swift"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing
  Then I press "pause"
  Then I press "actionBackArrow"
  Then I wait for 1 second
  Then I long press "01 Mine.m3u"
  Then I wait for 3 seconds
  Then I swipe to up
  Then I press "Delete"
  Then I wait for 2 seconds

Scenario: Play/Pause Music (Albums tab)
  Then I press "icon"
  Then I press "Albums"
  Then I scroll up
  Then I press "Reggatta"
  Then I press "01 Message in a Bottle"
  Then I go back
  Then I wait for 1 second
  When I press "slide_panel_now_playing_title"
  Then I see "02 The Police"
  And I should see text containing "01 Message in a Bottle"
  And I see "4:50"
  And I see "1/3"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing
  Then I press "pause"
  Then I go back
  Then I wait for 5 seconds
  # Then I go back
  Then I scroll up
  Then I press "Playlists"
  Then I press "Folders"

Scenario: Play/Pause Music - long press (Albums tab)
  Then I press "icon"
  Then I press "Albums"
  Then I scroll up
  Then I long press "Dark Horse"
  Then I press "Play"
  When I press "slide_panel_now_playing_title"
  Then I see "01 Nickelback"
  And I should see text containing "01 Shakin\' Hands"
  And I should see text containing "Dark Horse"
  And I see "3:39"
  And I see "1/2"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing
  Then I press "pause"
  Then I press "actionBackArrow"
  Then I scroll up
  Then I press "Playlists"
  Then I press "Folders"

Scenario: Play/Pause Music (Artists tab)
  Then I press "icon"
  Then I press "Albums"
  Then I press "Artists"
  Then I press "02 The Police"
  Then I touch the "Reggatta" text
  Then I press "01 Message in a Bottle"
  Then I go back
  Then I wait for 1 second
  When I press "slide_panel_now_playing_title"
  Then I see "02 The Police"
  And I should see text containing "01 Message in a Bottle"
  And I should see text containing "Reggatta"
  And I see "4:50"
  And I see "1/3"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing
  Then I press "pause"
  Then I press "actionBackArrow"
  Then I scroll up
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"

Scenario: Play/Pause Music - long press (Artists tab)
  Then I press "icon"
  Then I press "Albums"
  Then I press "Artists"
  Then I long press "01 Nickelback"
  Then I press "Play"
  When I press "slide_panel_now_playing_title"
  Then I see "01 Nickelback"
  And I should see text containing "01 Shakin\' Hands"
  And I should see text containing "Dark Horse"
  And I see "3:39"
  And I see "1/2"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing
  Then I press "pause"
  Then I go back
  Then I scroll up
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"

Scenario: Play/Pause Music (Songs tab)
  Then I press "icon"
  Then I press "Albums"
  Then I press "Artists"
  Then I press "Songs"
  Then I press "01 Mine"
  When I press "slide_panel_now_playing_title"
  Then I see "03 Taylor Swift"
  And I should see text containing "01 Mine"
  And I see "3:50"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing
  Then I press "pause"
  Then I go back
  Then I press "Artists"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"

Scenario: Play/Pause Music - long press (Songs tab)
  Then I press "icon"
  Then I press "Albums"
  Then I press "Artists"
  Then I press "Songs"
  Then I long press "01 Message in a Bottle"
  Then I press "Play"
  When I press "slide_panel_now_playing_title"
  Then I see "02 The Police"
  And I should see text containing "01 Message in a Bottle"
  And I see "4:50"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing
  Then I press "pause"
  Then I go back
  Then I press "Artists"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"

Scenario: Switching between tracks
  Then I press "icon"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"
  Then I go back
  Then I wait for 1 second
  Then I long press "Taylor Swift - Speak Now"
  Then I press "Play"
  Then I press "slide_panel_now_playing_title"
  Then I see "01 Mine"
  Then I see "1/3"
  When I press "next_control"
  Then I see "02 Sparks Fly"
  Then I see "2/3"
  When I press "next_control"
  Then I see "03 Back To December"
  Then I see "3/3"
  When I press "prev_control"
  Then I see "02 Sparks Fly"
  Then I see "2/3"
  When I press "prev_control"
  Then I see "1 Mine"
  Then I see "1/3"
  Then I swipe to right
  Then I see "02 Sparks Fly"
  Then I see "2/3"
  Then I swipe to right
  Then I see "03 Back To December"
  Then I see "3/3"
  Then I press "pause"
  Then I press "actionBackArrow"
  Then I scroll up

Scenario: Tap on cover open current folder
  Then I press "icon"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"
  Then I go back
  Then I wait for 2 seconds
  Then I long press "Nickelback - Dark Horse"
  Then I press "Play"
  Then I press "slide_panel_now_playing_title"
  And I should see text containing "01 Shakin\' Hands"
  And I should see text containing "Dark Horse"
  Then I tap on cover
  And I see "Nickelback - Dark Horse"
  And I see "01 Shakin\' Hands"
  And I see "02 S.E.X."
  Then I press "actionBackArrow"
  Then I wait for 1 second
  Then I press "actionBackArrow"
  Then I scroll up

Scenario: Long press actions - Add/Rename/Delete (Playlists tab)
  Then I press "icon"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"
  Then I go back
  Then I wait for 1 second
  Then I long press "Taylor Swift - Speak Now"
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "Taylor Swift"
  # To hide keyboard
  Then I go back
  Then I press "Save"
  Then I press "Playlists"
  Then I scroll to "Taylor Swift.m3u" text
  Then I press "Taylor Swift.m3u"
  And I see "01 Mine"
  And I see "02 Sparks Fly"
  Then I scroll down
  And I see "03 Back To December"
  Then I scroll up
  Then I go back
  Then I wait for 1 second
  Then I long press "Taylor Swift.m3u"
  Then I wait for 2 seconds
  Then I swipe to up
  Then I press "Rename"
  Then I clear "playlist"
  Then I enter text "Custom"
  Then I go back
  Then I wait
  Then I press "Save"
  Then I wait
  And I see "Custom.m3u"
  Then I long press "Custom.m3u"
  Then I wait for 3 seconds
  Then I swipe to up
  Then I press "Delete"
  And I don't see "Custom.m3u"
  Then I press "Folders"

Scenario: Long press actions - Play From the ... (Playlists tab)
  Then I press "icon"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"
  Then I go back
  Then I wait for 1 second
  Then I long press "Nickelback - Dark Horse"
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "Nickelback"
  # To hide keyboard
  Then I go back
  Then I press "Save"
  Then I press "Playlists"
  Then I scroll to "Nickelback.m3u" text
  Then I long press "Nickelback.m3u"
  Then I press "Play from the beginning"
  Then I press "slide_panel_now_playing_title"
  And I should see text containing "01 Shakin\' Hands"
  And I should see text containing "Dark Horse"
  And I see "3:39"
  And I see "1/2"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing
  Then I press "next_control"
  And I see "02 S.E.X."
  And I see "2/2"
  Then I go back
  Then I wait for 1 second
  Then I go back
  Then I wait for 1 second
  Then I scroll up
  Then I press "On The Go"
  Then I wait for 2 seconds
  Then I press list item number 1
  Then I press "actionBackArrow"
  Then I wait for 1 second
  Then I long press "Nickelback.m3u"
  When I press "Play from the saved position"
  Then I wait for 2 seconds
  Then I press "actionBackArrow"
  Then I wait for 1 second
  Then I press "slide_panel_now_playing_title"
  And I should see text containing "02 S.E.X."
  And I should see text containing "Dark Horse"
  And I see "2/2"
  And I see "3:53"
  Then I press "pause"
  Then I go back
  Then I wait for 1 second
  Then I long press "Nickelback.m3u"
  Then I wait for 3 seconds
  Then I swipe to up
  And I press "Delete"
  Then I press "Folders"

Scenario: Long press actions - Add to playlist from playlist tab
  Then I press "icon"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"
  Then I go back
  Then I wait for 1 second
  Then I long press "Taylor Swift - Speak Now"
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "Swift"
  # To hide keyboard
  Then I go back
  Then I press "Save"
  Then I press "Playlists"
  Then I scroll to "Swift.m3u" text
  Then I press "Swift.m3u"
  And I see "01 Mine"
  And I see "02 Sparks Fly"
  Then I scroll down
  And I see "03 Back To December"
  Then I scroll up
  Then I go back
  Then I wait for 2 seconds
  Then I long press "Swift.m3u"
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "Swift Copy"
  # To hide keyboard
  Then I go back
  Then I press "Save"
  Then I scroll to "Swift Copy.m3u" text
  Then I see "Swift Copy.m3u"
  Then I press "Swift Copy.m3u"
  And I see "01 Mine"
  And I see "02 Sparks Fly"
  Then I scroll down
  And I see "03 Back To December"
  Then I scroll up
  Then I go back
  Then I wait for 2 seconds
  Then I long press "Swift Copy.m3u"
  Then I wait for 3 seconds
  Then I swipe to up
  Then I press "Delete"
  Then I scroll to "Swift.m3u" text
  Then I long press "Swift.m3u"
  Then I wait for 3 seconds
  Then I swipe to up
  Then I press "Delete"
  Then I press "Folders"

Scenario: Long press actions - Add/Delete playlist from Albums tab
  Then I press "icon"
  Then I press "Albums"
  Then I long press "Dark Horse"
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "From_Albums"
  Then I go back
  Then I wait for 2 seconds
  Then I press "Save"
  Then I press "Playlists"
  Then I scroll to "From_Albums.m3u" text
  And I see "From_Albums.m3u"
  When I press "From_Albums.m3u"
  Then I see "01 Shakin\' Hands"
  And I see "1/2"
  And I see "02 S.E.X."
  And I see "2/2"
  Then I go back
  Then I wait for 1 second
  Then I long press "From_Albums.m3u"
  Then I wait for 3 seconds
  Then I swipe to up
  Then I press "Delete"
  Then I wait for 1 second
  Then I don't see "From_Albums.m3u"

Scenario: Long press actions - Add to the On The Go playlist from Albums tab
  Then I press "icon"
  Then I press "Albums"
  Then I long press "Dark Horse"
  Then I wait for 1 second
  Then I press "Play"
  Then I long press "Reggatta"
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press "On The Go"
  Then I press "Playlists"
  Then I press "On The Go"
  And I see "01 Message in a Bottle"
  And I see "3/5"
  Then I go back
   
Scenario: Long press actions - Add/Delete playlist from Artists tab
  Then I press "icon"
  Then I press "Albums"
  Then I press "Artists"
  Then I long press "02 The Police"
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear input field with id "playlist"
  Then I enter text "From_Artists"
  Then I go back
  Then I press "Save"
  Then I press "Albums"
  When I press "Playlists"
  Then I scroll to "From_Artists.m3u" text
  Then I see "From_Artists.m3u"
  When I press "From_Artists.m3u"
  Then I see "01 Message in a Bottle"
  Then I see "02 Reggatta de Blanc"
  Then I scroll down
  Then I see "03 It\'s Alright for You"
  Then I scroll up
  Then I go back
  Then I wait for 1 second
  Then I long press "From_Artists.m3u"
  Then I wait for 3 seconds
  Then I swipe to up
  Then I press "Delete"
  Then I wait for 1 second
  Then I don't see "From_Artists.m3u"

Scenario: Long press actions - Add to the On The Go playlist from Artist tab
  Then I press "icon"
  Then I press "Albums"
  Then I long press "Dark Horse"
  Then I wait for 1 second
  Then I press "Play"
  Then I press "Artists"
  Then I press "02 The Police"
  Then I press "Reggatta"
  Then I long press "01 Message in a Bottle"
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press "On The Go"
  Then I go back
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "On The Go"
  And I see "01 Message in a Bottle"
  And I see "3/3"
  Then I go back

Scenario: Long press actions - Add/Delete playlist from Songs tab
  Then I press "icon"
  Then I press "Albums"
  Then I press "Artists"
  Then I press "Songs"
  Then I long press "01 Mine"
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear input field with id "playlist"
  Then I enter text "From_Songs"
  Then I go back
  Then I press "Save"
  Then I press "Artists"
  Then I press "Albums"
  When I press "Playlists"
  Then I scroll to "From_Songs.m3u" text
  And I see "From_Songs.m3u"
  Then I press "From_Songs.m3u"
  And I see "01 Mine"
  And I see "1/1"
  Then I go back
  Then I wait for 1 second
  Then I long press "From_Songs.m3u"
  Then I wait for 3 seconds
  Then I swipe to up
  Then I press "Delete"
  Then I wait for 1 second
  Then I don't see "From_Songs.m3u"


Scenario: Long press actions - Add to the On The Go playlist from Songs tab
  Then I press "icon"
  Then I press "Albums"
  Then I long press "Dark Horse"
  Then I wait for 1 second
  Then I press "Play"
  Then I press "Artists"
  Then I press "Songs"
  Then I long press "01 Mine"
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press "On The Go"
  Then I press "Artists"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "On The Go"
  And I see "01 Mine"
  And I see "3/3"
  Then I go back
  

Scenario: Long press actions - Add to the On The Go playlist from Songs tab if User has the PL 
  Then I press "icon"
  Then I press "Albums"
  Then I long press "Dark Horse"
  Then I wait for 1 second
  Then I press "Play"
  Then I press "Artists"
  Then I press "Songs"
  Then I long press "01 Message in a Bottle"
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear input field with id "playlist"
  Then I enter text "On_the_Go_Songs"
  Then I go back
  Then I press "Save"
  Then I long press "01 Mine"
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press "On The Go"
  Then I press "Artists"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "On The Go"
  And I see "01 Mine"
  And I see "3/3"
  Then I go back
  Then I wait for 1 second
  Then I long press "On_the_Go_Songs.m3u"
  Then I wait for 3 seconds
  Then I swipe to up
  Then I press "Delete"
  Then I wait for 1 second
  Then I don't see "On_the_Go_Songs.m3u"


Scenario: Long press actions - Add to the On The Go playlist from Search tab
  Then I press "icon"
  Then I wait
  Then I press "Playlists"
  Then I press "Albums"
  Then I long press "Dark Horse"
  Then I wait for 1 second
  Then I press "Play"
  Then I press "Artists"
  Then I press "Songs"
  Then I press "Search"
  Then I press "search_bar"
  Then I enter text "Mine"
  Then I wait for 5 seconds
  Then I see "01 Mine"
  Then I press "01 Mine"
  Then I long press "03 Taylor Swift - Speak Now"
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear input field with id "playlist"
  Then I enter text "On_the_Go_Search"
  Then I go back
  Then I press "Save"
  Then I long press "03 Taylor Swift - Speak Now"
  Then I press "Add to playlist"
  Then I press "On The Go"
  Then I press "Songs"
  Then I press "Artists"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "On The Go"
  Then I full scroll down
  Then I wait for 2 seconds
  Then I see "01 Mine"
  Then I go back
  Then I long press "On_the_Go_Search"
  Then I press "Delete"
  Then I wait for 1 second
  Then I don't see "On_the_Go_Search"
@a
Scenario: Long press actions - Add to the On The Go playlist from Playlist tab
  Then I press "icon"
  Then I wait for 10 seconds
  Then I press "Playlists"
  Then I press "Albums"
  Then I long press "Dark Horse"
  Then I wait for 1 second
  Then I press "Play"
  Then I long press "Reggatta"
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press "On The Go"
  Then I long press "Speak Now"
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press "On The Go"
  Then I press "Playlists"
  Then I press "On The Go"
  Then I long press "02 S.E.X"
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear input field with id "playlist"
  Then I enter text "On_the_Go_Playlists"
  Then I go back
  Then I press "Save"
  Then I long press "02 S.E.X"
  Then I press "Add to playlist"
  Then I press "On The Go"
  Then I full scroll down
  Then I wait for 2 seconds
  Then I see "02 S.E.X"
  Then I go back
  Then I long press "On_the_Go_Playlists"
  Then I press "Delete"
  Then I wait for 1 second
  Then I don't see "On_the_Go_Playlists"

Scenario: Long press actions - Jum to .. (Songs tab)
  Then I press "icon"
  Then I press "Albums"
  Then I press "Artists"
  Then I press "Songs"
  Then I long press "01 Mine"
  Then I press "Jump to Album"
  Then I wait for 3 seconds
  And I see "Speak Now"
  Then I scroll up
  And I see "01 Mine"
  And I see "02 Sparks Fly"
  Then I scroll down
  And I see "03 Back To December"
  Then I scroll up
  Then I press "actionBackArrow"
  Then I wait for 1 second
  Then I press "Artists"
  Then I press "Songs"
  Then I long press "01 Message in a Bottle"
  Then I press "Jump to Artist"
  Then I wait for 3 seconds
  And I see "02 The Police"
  And I see "Reggatta"
  And I see "3 song"
  And I press "02 The Police"
  Then I scroll up
  Then I press "Songs"
  Then I long press "01 Message in a Bottle"
  Then I wait for 3 seconds
  Then I swipe to up
  Then I press "Jump to Folder"
  Then I wait for 3 seconds
  Then I see "01 Message in a Bottle"
  And I see "02 Reggatta de Blanc"
  Then I scroll down
  And I see "03 It\'s Alright for You"
  Then I scroll up
  Then I press " .. "

Scenario: Long press actions - Jum to Folder (Albums tab)
  Then I press "icon"
  Then I press "Albums"
  Then I scroll up
  Then I press "Dark Horse"
  Then I long press "02 S.E.X."
  Then I press "Jump to Folder"
  Then I wait for 3 seconds
  And I see "01 Shakin\' Hands"
  And I see "1/2"
  Then I scroll down
  And I see "02 S.E.X."
  And I see "2/2"
  Then I scroll up
  And I press " .. "
  
Scenario: Long press actions - Jum to Folder (Artists tab)
  Then I press "icon"
  Then I press "Albums"
  Then I press "Artists"
  Then I press "02 The Police"
  Then I press "Reggatta"
  Then I long press "01 Message in a Bottle"
  Then I press "Jump to Folder"
  Then I wait for 3 seconds
  And I see "01 Message in a Bottle"
  And I see "02 Reggatta de Blanc"
  Then I scroll down
  And I see "03 It\'s Alright for You"
  Then I scroll up
  And I press " .. "
  Then I scroll up

Scenario: Exit option
  Then I press "icon"
  Then I press "leftButtonFirst"
  Then I press "Home"
  Then I see "Where is My Car"
  Then I see "WebRadio"

Scenario: Equalizer
  Then I press "icon"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"
  Then I go back
  Then I press "Taylor Swift - Speak Now"
  Then I press "01 Mine"
  Then I press " .. "
  Then I press "slide_panel_now_playing_title"
  Then I press "action_aqualizer"
  Then I see "Equalizer Flat"
  Then I press "PRESETS"
  Then I press "Jazz"
  Then I wait for 2 seconds
  Then I press "actionBackArrow"
  Then I press "action_aqualizer"
  Then I see "Equalizer Jazz"
  Then I restart application
  Then I press "icon"
  Then I press "slide_panel_now_playing_title"
  Then I press "action_aqualizer"
  Then I see "Equalizer Jazz"
  Then I press "PRESETS"
  Then I press "Flat"

Scenario: Search
  Then I press "icon"
  Then I press "Albums"
  Then I press "Artists"
  Then I press "Songs"
  Then I press "Search" 
  Then I press "search_bar"
  Then I enter text "01 Mi"
  Then I wait for 5 seconds
  Then I see "01 Mine"
  Then I press "01 Mine"
  Then I wait for 2 seconds
  And I see "03 Taylor Swift - Speak Now"
  Then I press "Songs"
  Then I press "Artists"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"

Scenario: Add to Playlist from Search tab
  Then I press "icon"
  Then I press "Albums"
  Then I press "Artists"
  Then I press "Songs"
  Then I press "Search" 
  Then I press "search_bar"
  Then I enter text "02 Spa"
  Then I wait for 5 seconds
  Then I see "02 Sparks Fly"
  Then I press "02 Sparks Fly"
  Then I long press "03 Taylor Swift - Speak Now"
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "From_Search"
  # To hide keyboard
  Then I go back
  Then I wait for 2 seconds
  Then I press "Save" 
  Then I press "Songs"
  Then I press "Artists"
  Then I press "Albums"
  Then I press "Playlists"
  And I see "From_Search"
  Then I long press "From_Search"
  Then I wait for 2 seconds
  Then I swipe to up
  Then I press "Delete"
  Then I press "Folders" 

Scenario: Check Repeat and Shuffle option after switch plugin 
  Then I press icon "name" with text "Local Music"
  Then I press "Folders"
  Then I press "Nickelback - Dark Horse"
  Then I press "02 S.E.X."
  Then I press " .. "
  Then I press "slide_panel_now_playing_title"
  Then I press "shuffle"
  Then I check "shuffle" status "SideButtonLeft On"
  Then I press "repeat"
  Then I check "repeat" status "SideButtonRight On"
  Then I press "leftButtonFirst"
  Then I press "Home"
  Then I press icon "name" with text "WebRadio"
  Then I wait
  Then I press "leftButtonFirst"
  Then I press "Home"
  Then I press icon "name" with text "Local Music"
  Then I wait
  Then I press "slide_panel_now_playing_title"
  Then I check "shuffle" status "SideButtonLeft On"
  Then I check "repeat" status "SideButtonRight On"
  Then I press "shuffle"
  Then I press "repeat"
  Then I check "shuffle" status "SideButtonLeft Off"
  Then I check "repeat" status "SideButtonRight Off"   

Scenario: Play/Pause Music when change orientation
  Then I press "icon"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"
  Then I go back
  Then I press "Taylor Swift - Speak Now"
  Then I long press "01 Mine"
  Then I rotate device to landscape
  Then I wait for 1 second
  Then I press "Play"
  Then I wait for 1 second
  Then I rotate device to portrait
  Then I wait for 2 seconds
  Then I go back
  Then I wait for 2 seconds
  Then I press "slide_panel_now_playing_title"
  Then I should see text containing "01 Mine"
  Then I should see text containing "Speak Now"
  Then I see "03 Taylor Swift"
  And I see "3:50"
  And I see "1/3"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing
  Then I press "pause"
  Then I press "actionBackArrow"
  Then I scroll up  