Feature: GMusic
  You have to (export ADB_DEVICE_ARG=****)

Scenario: Start
  Then I press "closeButton"
  Then I press "button2" 
  Then I press "menu_button"
  Then I press "replace"
  Then I press "PLUGINS"
  Then I press "GMusic"

Scenario: Check background text
  Then I press "icon"
  Then I wait for 4 seconds
  Then I click CANCEL button
  Then I wait for 2 seconds
  Then I press "Playlists"
  And I see "You need to login to use the services. Use Options->Accounts"
  Then I press "Albums"
  And I see "You need to login to use the services. Use Options->Accounts"
  Then I press "Artists"
  And I see "You need to login to use the services. Use Options->Accounts"
  Then I press "Songs"
  And I see "You need to login to use the services. Use Options->Accounts"
  Then I press "Search"
  And I see "Enter keyword or phrase to search"
  Then I press "Artists"
  Then I press "Albums"
  Then I press "Playlists"
  Then I wait for 1 second

Scenario: Navigation through the plugin
  Then I press "icon"
  Then I wait for 4 seconds
  Then I login to GMusic
  Then I wait for 2 seconds
  Then I press "leftButtonFirst"
  Then I press "Sync"
  Then I wait for 5 seconds
  Then I press "Playlists"
  Then I see "Playlists"
  Then I see "On The Go"
  And I see "Albums"
  And I see "Artists"
  Then I press "Artists"
  Then I press "Songs"
  And I see "Songs"
  And I see "Search"
  Then I press "Artists"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "leftButtonFirst"
  And I see "Accounts"
  And I see "Log Out"
  And I see "Sync"
  And I see "Settings"
  Then I swipe to Exit
  And I see "About"
  And I see "Home"

Scenario: Navigation through the Settings
  Then I press "icon"  
  Then I press "leftButtonFirst"
  Then I press "Settings"
  Then I see "GMusic Settings"
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
  And I see "Show Playing Now tracks/stations"
  And I see "Update cover art from internet"
  Then I press "leftButtonFirst"
  Then I see "AutoHide Panels"
  Then I press "AutoHide Panels"
  And I see "Hide Navigation panels when browsing long lists to free up more space for text data"
  Then I see "Cover art resources"
  And I see "Change order of how cover art is searched"
  When I press "Cover art resources"
  Then I see "Lastfm"
  Then I see "Musicbrainz"
  And I see "Save"
  And I see "Cancel"
  Then I go back
  Then I scroll to text "Cache options"
  Then I see "Cache"
  Then I see "Cache folder"
  Then I see "Cache options"
  When I press "Cache options"
  And I see "OK"
  And I see "Clear tracks cache"
  When I press "Clear tracks cache"
  Then I see "Sure to remove tracks from local cache?"
  And I see "OK"
  And I see "Cancel"
  Then I press "Cancel"
  
Scenario: Check About section
  Then I press "icon"  
  Then I press "leftButtonFirst"
  Then I swipe to Exit
  Then I press "About"
  Then I see "Google Music (cloud storage) player for DashLinQ. Plays personal tracks stored on Google Music, automatic cover art updates, offline playback and voice search."
  Then I see "Copyright GROM Audio 2015"

# On The Go

Scenario: Play/Pause music & add to playlist - On The Go
  Then I press "icon"
  Then I press "Playlists"
  Then I press "On The Go"
  Then I long press "Dreams"
  Then I wait for 1 second
  Then I press "Play"
  Then I press "slide_panel_now_playing_title"
  Then I wait for start
  Then I see "Dreams - Greatest Hits"
  And I see "2/20"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I wait for 1 second
  Then I go back
  Then I wait for 1 second
  Then I long press "Dreams"
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "From_On_The_Go"
  # To hide keyboard
  Then I go back
  Then I press "Save"
  Then I press "On The Go"
  And I see "From_On_The_Go"
  And I see "1 Song"
  Then I long press "From_On_The_Go"
  Then I wait for 2 seconds
  Then I drag from 50:75 to 50:25 moving with 15 steps
  Then I press "Delete"
  Then I wait for 2 seconds

Scenario: Check Repeat and Shuffle option after switch plugin 
  Then I press icon "name" with text "GMusic"
  Then I press "Playlists"
  Then I press "slide_panel_now_playing_title"
  Then I press "shuffle"
  Then I check "shuffle" status "SideButtonLeft On"
  Then I press "repeat"
  Then I check "repeat" status "SideButtonRight On"
  Then I press "leftButtonFirst"
  Then I swipe to Exit
  Then I press "Home"
  Then I press icon "name" with text "WebRadio"
  Then I wait
  Then I press "leftButtonFirst"
  Then I press "Home"
  Then I press icon "name" with text "GMusic"
  Then I wait
  Then I press "slide_panel_now_playing_title"
  Then I check "shuffle" status "SideButtonLeft On"
  Then I check "repeat" status "SideButtonRight On"
  Then I press "shuffle"
  Then I press "repeat"
  Then I check "shuffle" status "SideButtonLeft Off"
  Then I check "repeat" status "SideButtonRight Off"     

# Albums Tab

Scenario: Play/Pause music - Albums tab
  Then I press "icon"
  Then I press "Albums"
  Then I drag from 50:30 to 50:300 moving with 20 steps
  Then I press "Adele - 21"
  Then I scroll up
  Then I press "Rolling In The Deep"
  Then I press "slide_panel_now_playing_title"
  Then I wait for start
  Then I see "Rolling In The Deep"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I wait for 1 second
  Then I go back
  # Long press play
  Then I wait for 1 second
  Then I long press "Rumor Has It"
  Then I press "Play"
  Then I press "slide_panel_now_playing_title"
  Then I wait for start
  Then I see "Rumor Has It"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I go back
  Then I wait for 1 second
  Then I go back
  Then I press "Playlists"

Scenario: Check Albums tab
  Then I press "icon"
  Then I press "Albums"
  Then I full scroll down
  Then I scroll up to "Adele - 21" text
  Then I wait for 1 second
  When I press "Adele"
  And I see "Adele - 21"
  And I see "Rolling In The Deep"
  And I see "1/4"
  And I see "3:48"
  And I see "Rumor Has It"
  And I see "2/4"
  And I see "3:43"
  Then I scroll down
  And I see "He Won\'t Go"
  And I see "3/4"
  And I see "4:37"
  And I see "Lovesong"
  And I see "4/4"
  And I see "5:16"
  Then I scroll up
  Then I go back
  Then I wait for 1 second

  Then I full scroll down
  Then I scroll up to "Buffy" text
  Then I wait for 1 second
  Then I press "Buffy"
  And I see "Buffy First Love"
  And I see "2 Find U"
  And I see "1/4"
  And I see "3:52"
  And I see "Someday"
  And I see "2/4"
  And I see "4:19"
  Then I scroll down
  And I see "I Miss You"
  And I see "3/4"
  And I see "5:04"
  And I see "First Love"
  And I see "4/4"
  And I see "5:05"
  Then I scroll up
  Then I go back

  Then I wait for 2 seconds
  Then I full scroll down
  Then I scroll up to "Adam Lambert" text
  Then I wait for 1 second
  When I press "Adam Lambert"
  And I see "For Your Entertainment"
  And I see "Music Again"
  And I see "1/4"
  And I see "3:16"
  And I see "Strut"
  And I see "2/4"
  And I see "3:29"
  Then I scroll down
  And I see "Soaked"
  And I see "3/4"
  And I see "4:33"
  And I see "Fever"
  And I see "4/4"
  And I see "3:26"
  Then I scroll up
  Then I go back

  Then I wait for 2 seconds
  Then I full scroll down
  Then I scroll up to "Greatest Hits" text
  Then I wait for 1 second
  When I touch the "Greatest Hits" text
  And I see "Greatest Hits"
  And I see "Gypsy"
  And I see "1/4"
  And I see "4:24"
  And I see "Dreams"
  And I see "2/4"
  And I see "4:14"
  Then I scroll down
  And I see "Tusk"
  And I see "3/4"
  And I see "3:30"
  And I see "Sara"
  And I see "4/4"
  And I see "6:21"
  Then I scroll up
  Then I go back
 
  Then I wait for 2 seconds
  Then I full scroll down
  Then I scroll up to "Queen" text
  Then I wait for 1 second
  When I press "Queen"
  And I see "A Kind Of Magic"
  And I see "Queen - A Kind Of Magic"
  And I see "1/4"
  And I see "4:24"
  And I see "One Vision"
  And I see "2/4"
  And I see "5:11"
  Then I scroll down
  And I see "Forever"
  And I see "3/4"
  And I see "3:20"
  And I see "One Year Of Love"
  And I see "4/4"
  And I see "4:27"
  Then I scroll up
  Then I go back
  Then I drag from 50:30 to 50:300 moving with 20 steps
  Then I press "Playlists"

Scenario: Add to playlist from Albums tab
  Then I press "icon"
  Then I press "Albums"
  Then I drag from 50:30 to 50:300 moving with 20 steps
  Then I long press "Adele - 21"
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "From_Album"
  # To hide keyboard
  Then I go back
  Then I press "Save"
  Then I press "Playlists"
  And I see "From_Album"
  Then I press "From_Album.m3u"
  And I see "Rolling In The Deep"
  And I see "Rumor Has It"
  Then I scroll down
  And I see "He Won\'t Go"
  And I see "Lovesong"
  Then I scroll up
  Then I go back
  Then I wait for 2 seconds
  Then I long press "From_Album.m3u"
  Then I wait for 2 seconds
  Then I drag from 50:75 to 50:25 moving with 15 steps
  Then I press "Delete"
  Then I wait for 2 seconds

Scenario: Switching between tracks - Albums tab 
  Then I press "icon"
  Then I press "Albums"
  Then I drag from 50:30 to 50:300 moving with 20 steps
  Then I press "Buffy"
  Then I scroll up
  Then I press "Someday"
  Then I press "slide_panel_now_playing_title"
  Then I see "Someday"
  Then I see "Buffy First Love" 
  And I see "2/4"
  Then I press "next_control"
  Then I see "I Miss You"
  And I see "3/4"
  Then I press "prev_control"
  Then I see "Someday"
  And I see "2/4"
  # Swipe Switching
  Then I wait for 2 seconds
  Then I swipe to right
  Then I see "I Miss You"
  Then I see "3/4"
  Then I swipe to left
  Then I see "Someday"
  Then I see "2/4"
  Then I press "pause"
  Then I go back
  Then I wait for 1 second
  Then I go back
  Then I press "Playlists"

Scenario: Tap on cover  
  Then I press "icon"
  Then I press "Albums"
  Then I drag from 50:30 to 50:300 moving with 20 steps
  Then I long press "Adele - 21"
  Then I press "Play"
  Then I press "slide_panel_now_playing_title"
  And I see "GMusic"
  Then I tap on cover
  And I see "Adele - 21"
  And I see "Rolling In The Deep"
  And I see "Rumor Has It"
  Then I scroll down
  And I see "He Won\'t Go"
  And I see "Lovesong"
  Then I scroll up
  Then I go back
  Then I wait for 1 second
  Then I go back
  Then I press "Playlists"

# Artists Tab

Scenario: Check Artists tab
  Then I press "icon"
  Then I press "Artists"
  Then I see "Adam Lambert"
  And I see "1 album, 4 songs out of 4"
  When I press "Adam Lambert"
  Then I see "For Your Entertainment"
  And I see "4 songs"
  Then I press "Adam Lambert"

  Then I see "Adele"
  When I press "Adele"
  And I see "Adele - 21"
  And I see "4 songs"
  Then I press "Adele"

  Then I scroll down to "Buffy" text
  Then I see "Buffy"
  When I press "Buffy"
  And I see "Buffy First Love"
  And I see "4 songs"
  Then I press "Buffy"

  Then I scroll to "Fleetwood Mac" text
  And I see "Fleetwood Mac"
  When I press "Fleetwood Mac"
  And I see "Greatest Hits"
  And I see "4 songs"
  Then I press "Fleetwood Mac"

  Then I scroll to "Queen" text
  Then I see "Queen"
  When I press "Queen"
  Then I see "A Kind Of Magic"
  And I see "4 songs"
  Then I press "Queen"
  Then I scroll up
  Then I scroll up
  Then I press "Albums"
  Then I press "Playlists"

Scenario: Add to playlist from Artists tab
  Then I press "icon"
  Then I press "Artists"
  Then I drag from 50:30 to 50:300 moving with 20 steps
  Then I long press "Adam Lambert"
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "From_Artist"
  # To hide keyboard
  Then I go back
  Then I press "Save"
  Then I press "Albums"
  Then I press "Playlists"
  And I see "From_Artist"
  Then I press "From_Artist.m3u"
  And I see "Music Again"
  And I see "1/4"
  And I see "Strut"
  And I see "2/4"
  Then I scroll down
  And I see "Soaked"
  And I see "3/4"
  And I see "Fever"
  And I see "4/4"
  Then I scroll up
  Then I press "actionBackArrow"
  Then I wait for 1 second
  Then I long press "From_Artist.m3u"
  Then I wait for 2 seconds
  Then I drag from 50:75 to 50:25 moving with 15 steps
  Then I press "Delete"
  Then I wait for 2 seconds

Scenario: Play/Pause music
  Then I press "icon"
  Then I press "Albums"
  Then I press "Artists"
  Then I drag from 50:30 to 50:300 moving with 20 steps
  Then I press "Adele"
  When I press "Adele - 21"
  Then I scroll up
  Then I press "Rumor Has It"
  Then I press "slide_panel_now_playing_title"
  Then I wait for start
  And I see "2/4"
  Then I see "Rumor Has It"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I go back
  # Long press play
  Then I wait for 1 seconds
  Then I go back
  Then I wait
  Then I long press "Adele"
  Then I press "Play"
  Then I press "slide_panel_now_playing_title"
  Then I wait for start
  Then I see "Rumor Has It"
  And I see "1/4"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I go back
  Then I wait for 1 second
  Then I press "Albums"
  Then I press "Playlists"

Scenario: Switching between tracks 
  Then I press "icon"
  Then I press "Albums"
  Then I press "Artists"
  Then I drag from 50:30 to 50:300 moving with 20 steps
  Then I press "Adele"
  Then I press "Adele - 21"
  Then I press "Rolling In The Deep" 
  Then I press "slide_panel_now_playing_title"
  Then I see "Rolling In The Deep" 
  And I see "1/4"
  Then I press "next_control"
  Then I see "Rumor Has It" 
  Then I see "Adele - 21"
  And I see "2/4"
  Then I press "prev_control"
  Then I see "Rolling In The Deep" 
  And I see "1/4"
  # Swipe Switching
  Then I wait for 2 seconds
  Then I swipe to right
  Then I see "Rumor Has It"
  Then I see "2/4"
  Then I swipe to left
  Then I see "Rolling In The Deep"
  Then I see "1/4"
  Then I press "pause"
  Then I go back
  Then I wait for 1 second
  Then I go back
  Then I press "Albums"
  Then I press "Playlists"

Scenario: Tap on cover  
  Then I press "icon"
  Then I press "Albums"
  Then I press "Artists"
  Then I drag from 50:30 to 50:300 moving with 20 steps
  Then I long press "Adam Lambert"
  Then I press "Play"
  Then I press "slide_panel_now_playing_title"
  And I see "GMusic"
  Then I wait for 2 seconds
  Then I tap on cover
  And I see "Adam Lambert"
  And I see "Music Again"
  And I see "1/4"
  And I see "Strut"
  And I see "2/4"
  Then I scroll down
  And I see "Soaked"
  And I see "3/4"
  And I see "Fever"
  And I see "4/4"
  Then I scroll up
  Then I go back
  Then I wait for 1 second
  Then I go back
  Then I press "Albums"
  Then I press "Playlists"

# Songs Tab

Scenario: Check Songs tab
  Then I press "icon"
  Then I press "Artists"
  Then I press "Songs"
  Then I wait for 2 seconds
  Then I drag from 50:30 to 50:300 moving with 20 steps

  Then I use_new_scroll down to "1/20" text
  And I see "2 Find U"

  Then I use_new_scroll down to "2/20" text
  And I see "Dreams"

  Then I use_new_scroll down to "3/20" text
  And I see "Fever"

  Then I use_new_scroll down to "4/20" text
  And I see "First Love"

  Then I use_new_scroll down to "5/20" text
  And I see "Forever"

  Then I use_new_scroll down to "6/20" text
  And I see "Gypsy"

  Then I use_new_scroll down to "7/20" text
  And I see "He Won\'t Go"

  Then I use_new_scroll down to "8/20" text
  And I see "I Miss You"

  Then I use_new_scroll down to "9/20" text
  And I see "A Kind Of Magic"

  Then I use_new_scroll down to "10/20" text
  And I see "Lovesong"

  Then I use_new_scroll down to "11/20" text
  And I see "Music Again"

  Then I use_new_scroll down to "12/20" text
  And I see "One Vision"

  Then I use_new_scroll down to "13/20" text
  And I see "One Year Of Love"

  Then I use_new_scroll down to "14/20" text
  And I see "Rolling In The Deep"

  Then I use_new_scroll down to "15/20" text
  And I see "Rumor Has It"

  Then I use_new_scroll down to "16/20" text
  And I see "Sara"

  Then I use_new_scroll down to "17/20" text
  And I see "Soaked"

  Then I use_new_scroll down to "18/20" text
  And I see "Someday"

  Then I use_new_scroll down to "19/20" text
  And I see "Strut"

  Then I use_new_scroll down to "20/20" text
  And I see "Tusk"

  Then I drag from 50:30 to 50:300 moving with 20 steps
  Then I drag from 50:30 to 50:300 moving with 20 steps
  Then I press "Artists"
  Then I press "Albums"
  Then I press "Playlists"

Scenario: Jump to Album/Artist options from Songs tab
  Then I press "icon"
  Then I press "Artists"
  Then I press "Songs"
  Then I long press "2 Find U"
  Then I press "Jump to Album"
  Then I wait for 2 seconds
  Then I see "Buffy First Love"
  Then I scroll up
  Then I see "2 Find U"
  And I see "Someday"
  Then I scroll down
  And I see "I Miss You"
  And I see "First Love"
  Then I scroll up
  Then I go back 
  Then I press "Songs"
  Then I wait for 1 second
  Then I long press "2 Find U"
  Then I press "Jump to Artist"
  Then I wait for 2 seconds
  Then I see "Buffy"
  And I see "Buffy First Love"
  And I see "4 songs"
  Then I press "Buffy"
  Then I drag from 50:30 to 50:300 moving with 20 steps
  Then I press "Albums"
  Then I press "Playlists" 

Scenario: Add to playlist from Songs tab
  Then I press "icon"
  Then I press "Artists"
  Then I press "Songs"
  Then I long press "Dreams"
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "From_Song"
  # To hide keyboard
  Then I go back
  Then I press "Save"
  Then I press "Artists"
  Then I press "Albums"
  Then I press "Playlists"
  Then I scroll to "From_Song.m3u" text
  And I see "From_Song"
  Then I press "From_Song.m3u"
  And I see "Fleetwood Mac - Greatest Hits"
  Then I go back
  Then I wait for 1 second
  Then I long press "From_Song.m3u"
  Then I wait for 2 seconds
  Then I drag from 50:75 to 50:25 moving with 15 steps
  Then I press "Delete"
  Then I wait for 2 seconds

Scenario: Play/Pause music
  Then I press "icon"
  Then I press "Albums"
  Then I press "Artists"
  Then I press "Songs"
  Then I press "2 Find U"
  Then I press "slide_panel_now_playing_title"
  Then I wait for start
  Then I see "2 Find U"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I go back
  # Long press play
  Then I wait for 2 seconds
  Then I long press "Dreams"
  Then I press "Play"
  Then I press "slide_panel_now_playing_title"
  Then I wait for start
  Then I see "Dreams"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I go back
  Then I press "Artists"
  Then I press "Albums"
  Then I press "Playlists"

Scenario: Switching between tracks 
  Then I press "icon"
  Then I press "Albums"
  Then I press "Artists"
  Then I press "Songs"
  Then I press "Dreams"
  Then I press "slide_panel_now_playing_title"
  Then I see "Dreams" 
  And I see "2/20"
  Then I press "next_control"
  Then I see "Fever"
  And I see "3/20"
  Then I press "prev_control"
  Then I see "Dreams" 
  And I see "2/20"
  # Swipe Switching
  Then I wait for 2 seconds
  Then I swipe to left
  Then I wait
  Then I see "2 Find U"
  Then I see "1/20"
  Then I swipe to right
  Then I see "Dreams"
  Then I see "2/20"
  Then I press "pause"
  Then I press "actionBackArrow"
  Then I press "Artists"
  Then I press "Albums"
  Then I press "Playlists"

# Playlists Tab

Scenario: Add/Rename/Delete playlists
  Then I press "icon"
  Then I press "Artists"
  Then I press "Songs"
  Then I drag from 50:30 to 50:300 moving with 20 steps
  Then I scroll to "Fever" text
  Then I long press "Fever"
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear input field with id "playlist"
  Then I enter text "Original"
  Then I go back
  Then I press "Save"
  Then I scroll up
  Then I press "Albums"
  Then I press "Playlists"
  Then I scroll to "Original.m3u" text
  Then I see "Original"
  Then I long press "Original.m3u"
  Then I wait for 2 seconds
  Then I drag from 50:75 to 50:25 moving with 15 steps
  Then I press "Rename"
  Then I clear input field with id "playlist"
  Then I enter text "Unoriginal"
  Then I go back
  Then I press "Save"
  Then I scroll to "Unoriginal.m3u" text
  And I see "Unoriginal"
  Then I long press "Unoriginal.m3u"
  Then I wait for 2 seconds
  Then I drag from 50:75 to 50:25 moving with 15 steps
  Then I press "Delete"
  Then I wait for 2 seconds

Scenario: Add to playlist from playlists tab
  Then I press "icon"
  Then I press "Albums"
  Then I drag from 50:30 to 50:300 moving with 20 steps
  Then I long press "Adele - 21"  
  Then I press "Add to playlist"
  Then I press "New"
  #Then I clear "playlist"
  Then I clear "Adele - 21"
  Then I enter text "TestPlaylist"
  Then I go back
  Then I press "Save"
  Then I press "Playlists"
  And I see "TestPlaylist"
  Then I long press "TestPlaylist.m3u"
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "TestPlaylist2"
  Then I go back
  Then I press "Save"
  Then I scroll to "TestPlaylist2.m3u" text
  And I see "TestPlaylist2"
  Then I long press "TestPlaylist2.m3u"
  Then I wait for 2 seconds
  Then I drag from 50:75 to 50:25 moving with 15 steps
  And I press "Delete"
  Then I scroll to "TestPlaylist.m3u" text
  And I see "TestPlaylist"
  Then I long press "TestPlaylist.m3u"
  Then I wait for 2 seconds
  Then I drag from 50:75 to 50:25 moving with 15 steps
  And I press "Delete"
  Then I wait for 2 seconds

Scenario: Long press actions - Play From the ...
  Then I press "icon"
  Then I press "Artists"
  Then I press "Albums"
  Then I drag from 50:30 to 50:300 moving with 20 steps
  Then I long press "Adele"
  Then I press "Add to playlist"
  Then I press "New"
  Then I press "Save"
  Then I press "Playlists"
  Then I scroll to "Adele - 21.m3u" text
  Then I long press "Adele - 21.m3u"
  Then I press "Play from the beginning"
  Then I press "slide_panel_now_playing_title"
  Then I wait for start
  And I should see text containing "Rolling In The Deep"
  And I see "3:48"
  And I see "1/4"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I wait for start
  Then I check Music playing
  Then I press "next_control"
  Then I press "next_control"
  And I see "He Won\'t Go"
  And I see "3/4"
  Then I go back
  Then I wait for 1 second
  Then I go back
  Then I scroll up
  Then I press "On The Go"
  Then I press list item number 1
  Then I go back
  Then I wait for 1 second
  Then I scroll to "Adele - 21.m3u" text
  Then I long press "Adele - 21.m3u"
  When I press "Play from the saved position"
  Then I press "slide_panel_now_playing_title"
  Then I wait for start
  And I should see text containing "He Won\'t Go"
  And I see "3/4"
  And I see "4:37"
  Then I press "pause"
  Then I go back
  Then I wait for 1 second
  Then I go back
  Then I long press "Adele - 21.m3u"
  Then I drag from 50:75 to 50:25 moving with 15 steps
  And I press "Delete"
  Then I wait for 2 seconds

Scenario: Long press actions - Add/Delete to/from the On The Go playlist in the Albums tab
  Then I press "icon"
  Then I press "Albums"
  Then I long press "Adele - 21"
  Then I wait for 1 second
  Then I press "Play"
  Then I long press "Buffy First Love"
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press "On The Go"
  Then I press "Playlists"
  Then I press "On The Go"
  And I see "2 Find U"
  And I see "5/8"
  Then I long press "2 Find U"
  Then I wait for 1 second
  Then I press "Delete"
  Then I don't see "2 Find U"
  Then I go back

Scenario: Long press actions - Add/Delete to/from the On The Go playlist in the Artist tab
  Then I press "icon"
  Then I press "Albums"
  Then I long press "Adele - 21"
  Then I wait for 1 second
  Then I press "Play"
  Then I press "Artists"
  Then I press "Adam Lambert"
  Then I press "For Your Entertainment"
  Then I long press "Music Again"
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press "On The Go"
  Then I go back
  Then I press "Albums"
  Then I press "Playlists"
  Then I wait for 5 seconds
  Then I press "On The Go"
  And I see "Music Again"
  And I see "5/5"
  Then I long press "Music Again"
  Then I wait for 1 second
  Then I press "Delete"
  Then I don't see "Music Again"
  Then I go back

Scenario: Long press actions - Add/Delete to/from the On The Go playlist in the Songs tab
  Then I press "icon"
  Then I press "Albums"
  Then I long press "Adele - 21"
  Then I wait for 1 second
  Then I press "Play"
  Then I press "Artists"
  Then I press "Songs"
  Then I long press "2 Find U"
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press "On The Go"
  Then I press "Artists"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "On The Go"
  And I see "2 Find U"
  And I see "5/5"
  Then I long press "2 Find U"
  Then I wait for 1 second
  Then I press "Delete"
  Then I don't see "2 Find U"
  Then I go back

Scenario: Long press actions - Add/Delete to/from the On The Go playlist from Songs tab if User has the PL 
  Then I press "icon"
  Then I press "Albums"
  Then I press "Artists"
  Then I press "Songs"
  Then I long press "2 Find U"
  Then I wait for 1 second
  Then I press "Play"
  Then I long press "Dreams"
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear input field with id "playlist"
  Then I enter text "On_the_Go_Songs"
  Then I go back
  Then I press "Save"
  Then I long press "Dreams"
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press "On The Go"
  Then I press "Artists"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "On The Go"
  Then I scroll to "Tusk" text
  Then I full scroll down
  And I see "Dreams"
  And I see "21/21"
  Then I long press "Dreams"
  Then I wait for 1 second
  Then I press "Delete"
  Then I don't see "Dreams"
  Then I go back
  Then I wait for 1 second
  Then I long press "On_the_Go_Songs.m3u"
  Then I wait for 3 seconds
  Then I swipe to up
  Then I press "Delete"
  Then I wait for 1 second
  Then I don't see "On_the_Go_Songs.m3u"

Scenario: Long press actions - Add/Delete to/from the On The Go playlist in the Search tab
  Then I press "icon"
  Then I press "Albums"
  Then I press "Artists"
  Then I press "Songs"
  Then I press "Dreams"
  Then I press "Search"
  Then I press "search_bar"
  Then I enter text "2 Find"
  Then I wait for 5 seconds
  Then I see "2 Find U"
  Then I press "2 Find U"
  Then I long press "Buffy - Buffy First Love"
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear input field with id "playlist"
  Then I enter text "On_the_Go_Search"
  Then I go back
  Then I press "Save"
  Then I long press "Buffy - Buffy First Love"
  Then I press "Add to playlist"
  Then I press "On The Go"
  Then I press "Songs"
  Then I press "Artists"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "On The Go"
  Then I full scroll down
  Then I wait for 2 seconds
  Then I see "2 Find U"
  Then I long press "2 Find U"
  Then I wait for 1 second
  Then I press "Delete"
  Then I don't see "2 Find U"
  Then I go back
  Then I long press "On_the_Go_Search"
  Then I press "Delete"
  Then I wait for 1 second
  Then I don't see "On_the_Go_Search"

Scenario: Long press actions - Add/Delete to/from the On The Go playlist in the Playlist tab
  Then I press "icon"
  Then I press "Playlists"
  Then I press "On The Go"
  Then I scroll up to text "2 Find U"
  Then I press "Dreams"
  Then I long press "2 Find U"
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear input field with id "playlist"
  Then I enter text "On_the_Go_Playlists"
  Then I go back
  Then I press "Save"
  Then I long press "2 Find U"
  Then I press "Add to playlist"
  Then I press "On The Go"
  Then I full scroll down
  Then I wait for 2 seconds
  Then I see "2 Find U"
  Then I long press "2 Find U"
  Then I wait for 1 second
  Then I press "Delete"
  Then I don't see "2 Find U"
  Then I go back
  Then I long press "On_the_Go_Playlists"
  Then I press "Delete"
  Then I wait for 1 second
  Then I don't see "On_the_Go_Playlists"

Scenario: Exit option
  Then I press "icon"
  Then I wait for 1 second
  Then I press "leftButtonFirst"
  Then I swipe to Exit
  Then I press "Home"
  Then I see "Where is My Car"
  Then I see "WebRadio"

Scenario: Equalizer
  Then I press "icon"
  Then I press "Artists"
  Then I press "Songs"
  Then I press "Dreams"
  Then I press "Albums"
  Then I press "Playlists"
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
  Then I enter text "Adel"
  Then I wait for 3 seconds
  Then I see "Adele"
  Then I see "Adele - 21"
  Then I press "Adele"
  Then I wait for 2 seconds
  And I see "Adele"
  And I see "Adele - 21"
  Then I press "Songs"
  Then I press "Artists"
  Then I press "Albums"
  Then I press "Playlists"

Scenario: Add to Playlist from Search tab
  Then I press "icon"
  Then I press "Albums"
  Then I press "Artists"
  Then I press "Songs"
  Then I press "Search" 
  Then I press "search_bar"
  Then I enter text "Drea"
  Then I wait for 5 seconds
  Then I see "Dreams"
  Then I press "Dreams"
  Then I long press "Fleetwood Mac - Greatest Hits"
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "From_Search"
  # To hide keyboard
  Then I go back
  Then I press "Save"
  Then I press "Songs"
  Then I press "Artists"
  Then I press "Albums"
  Then I press "Playlists"
  Then I scroll to "From_Search.m3u" text
  And I see "From_Search"
  Then I long press "From_Search.m3u"
  Then I wait for 2 seconds
  Then I drag from 50:75 to 50:25 moving with 15 steps
  Then I press "Delete"
  Then I wait for 2 seconds
        
Scenario: Play/Pause music change oriantation
  Then I press "icon"
  Then I press "Albums"
  Then I drag from 50:30 to 50:300 moving with 20 steps
  # Long press play
  Then I wait for 1 second
  Then I press "Adele - 21"
  Then I scroll up
  Then I long press "Rumor Has It"
  Then I rotate device to landscape
  Then I wait for 1 second
  Then I press "Play"
  Then I wait for 1 second
  Then I rotate device to portrait
  Then I wait for 2 seconds
  Then I press "slide_panel_now_playing_title"
  Then I wait for start
  Then I see "Rumor Has It"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I go back
  Then I wait for 1 second
  Then I go back
  Then I press "Playlists"

Scenario: Check track position
  Then I press "icon"
  Then I press "Albums"
  Then I press "Artists"
  Then I press "Songs"
  Then I press "Dreams"
  Then I press "slide_panel_now_playing_title"
  And I see "Fleetwood Mac"
  Then I press "status_text"
  Then I check timer    
  Then I restart application
  Then I wait for 1 seconds
  Then I swipe to down
  Then I tap on cover
  Then I wait for 3 seconds
  Then I check play position
  Then I check Music playing
    
  Then I press "status_text"
  Then I check timer
  Then I wait for 1 seconds  
  Then I restart application
  Then I wait for 1 seconds
  Then I tap on cover
  Then I wait for 4 seconds
  Then I check play position
  Then I check Music playing

  Then I press "status_text"
  Then I check timer  
  Then I wait for 1 seconds
  Then I restart application
  Then I wait for 1 seconds
  Then I tap on cover
  Then I wait for 4 seconds
  Then I check play position
  Then I check Music playing

  Then I press "status_text"
  Then I check timer 
  Then I wait for 1 seconds 
  Then I restart application
  Then I wait for 1 seconds
  Then I tap on cover
  Then I wait for 4 seconds
  Then I check play position
  Then I check Music playing

  # Check when track paused
  Then I tap on cover
  Then I press "2 Find U"
  # Then I press "slide_panel_now_playing_title"
  Then I press "status_text"
  Then I press "pause"
  Then I check timer
  And I see "Buffy"    
  Then I restart application
  Then I wait for 1 seconds
  Then I tap on cover
  Then I wait for 5 seconds
  Then I check pause position
  Then I check Music pause

  Then I check timer
  Then I restart application
  Then I wait for 1 seconds
  Then I tap on cover
  Then I wait for 5 seconds
  Then I check pause position
  Then I check Music pause

  Then I check timer
  Then I restart application
  Then I wait for 1 seconds
  Then I tap on cover
  Then I wait for 5 seconds
  Then I check pause position
  Then I check Music pause

  Then I check timer
  Then I restart application
  Then I wait for 1 seconds
  Then I tap on cover
  Then I wait for 5 seconds
  Then I check pause position
  Then I check Music pause

#Scenario: Check if all dialogs popup in the settings are displayed after rotate device
  #Then I press "icon"
  #Then I press "leftButtonFirst"
  #Then I press "Cover art resources"
  #Then I see "Cover art resources"
  #Then I see "Lastfm"
  #Then I see "Musicbrainz"
  #Then I see "SAVE"
  #Then I see "CANCEL"
  #Then I rotate device to landscape
  #Then I see "Cover art resources"
  #Then I see "Lastfm"
  #Then I see "Musicbrainz"
  #Then I see "SAVE"
  #Then I see "CANCEL"
  #Then I rotate device to portrait
  #Then I see "Cover art resources"
  #Then I see "Lastfm"
  #Then I see "Musicbrainz"
  #Then I see "SAVE"
  #Then I see "CANCEL"
  #Then I press "CANCEL"

  #Then I press "Cache options"
  #Then I see "Cache"
  #Then I see "OK"
  #Then I see "CLEAR TRACKS CACHE"
  #Then I rotate device to landscape
  #Then I see "Cache"
  #Then I see "OK"
  #Then I see "CLEAR TRACKS CACHE"
  #Then I rotate device to portrait
  #Then I see "Cache"
  #Then I see "OK"
  #Then I see "CLEAR TRACKS CACHE"
  #Then I press "OK"

Scenario: Log Out from plugin
  Then I press "icon"
  Then I press "leftButtonFirst"
  Then I press "Log Out"
  Then I wait for 1 second
  And I see "You need to login to use the services. Use Options->Accounts"
  Then I press "Albums"
  And I see "You need to login to use the services. Use Options->Accounts"
  Then I press "Artists"
  And I see "You need to login to use the services. Use Options->Accounts"
  Then I press "Songs"
  And I see "You need to login to use the services. Use Options->Accounts"
  Then I press "Search"
  And I see "Enter keyword or phrase to search"
  Then I press "Artists"
  Then I press "Albums"
  Then I press "Playlists"
  Then I wait for 1 second