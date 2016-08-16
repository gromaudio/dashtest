Feature: GMusic

Scenario: Start
  Then I press "skipButton"
  Then I press "button2" 
  Then I press "menu_button"
  Then I press "replace"
  Then I press "PLUGINS"
  Then I press "GMusic"
  Then I wait for 2 seconds

Scenario: Navigation through the widget
  Then I press "icon"
  Then I wait for 2 seconds
  Then I press item with name "kotorpiller@gmail.com"
  Then I press item with name "OK"
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
  Then I press "leftButtonFirst"
  And I see "Accounts"
  And I see "Sync"
  And I see "Settings"
  And I see "About"

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
  And I see "Show track information, file size, bitrate etc"
  And I see "Toggle Random on/off"
  And I see "Return to Library"
  And I see "Next category. Folder, Playlist, Album, Artist"
  And I see "Prev category. Folder, Playlist, Album, Artist"
  Then I see "FIXED ACTIONS"
  And I see "Previous Track"
  And I see "Next Track"
  And I see "Show Playing Now tracks"
  Then I scroll down
  And I see "Update cover art from internet"
  Then I press "leftButtonFirst"
  Then I see "AutoHide Panels"
  And I see "Hide Navigation panels when browsing long lists to free up more space for text data"
  Then I see "Library Side Swipe"
  And I see "Enable side swipe for faster library navigation"
  Then I see "Cover art resources"
  And I see "Change order of how cover art is searched"
  When I press "Cover art resources"
  Then I see "Lastfm"
  Then I see "Musicbrainz"
  And I see "Save"
  And I see "Cancel"
  Then I go back
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

Scenario: Check About section
  Then I press "icon"  
  Then I press "leftButtonFirst"
  Then I press "About"
  Then I see "Google Music (cloud storage) player for DashLinQ. Plays personal tracks stored on Google Music, automatic cover art updates, offline playback and voice search."
  Then I see "Copyright GROM Audio 2015"

Scenario: Navigation through the Long press Options
  Then I press "icon"
  Then I press "Artists"
  Then I press "Songs"
  Then I long press list item number 1
  And I see "Play"
  And I see "Add to playlist"
  And I see "Jump to Album"
  And I see "Jump to Artist"
  And I see "Update cover art"
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "Long press" into field with id "playlist"
  Then I go back
  Then I press "Save"
  Then I press "Artists"
  Then I long press list item number 1
  And I see "Play"
  And I see "Add to playlist"
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear input field with id "playlist"
  Then I enter text "Long_press" into field with id "playlist"
  Then I go back
  Then I press "Save"
  Then I press "Playlists"
  Then I long press "Long_press"
  And I see "Play"
  And I see "Add to playlist"
  And I see "Play from the beginning"
  And I see "Play from the saved position"
  And I see "Delete"
  And I see "Rename"
  Then I press "Delete"

Scenario: Jum to Album/Artist options
  Then I press "icon"
  Then I press "Songs"
  Then I long press "Beat Me Up"
  Then I press "Jump to Album"
  Then I see "Just Like You"
  And I see "Beat Me Up"
  Then I go back 
  Then I press "Songs"
  Then I long press "Beat Me Up"
  Then I press "Jump to Artist"
  And I see "Allison Iraheta"
  And I see "Just Like You"  

Scenario: Add to playlist from Albums tab
  Then I press "icon"
  Then I press "Albums"
  Then I long press image view number 3
  Then I long press list item number 2
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "From_Albums" into field with id "playlist"
  Then I go back
  Then I press "Save"
  Then I press "title"
  Then I press "Playlists"
  And I see "From_Albums"
  Then I long press "From_Albums"
  Then I press "Delete"
   
Scenario: Add to playlist from Artists tab
  Then I press "icon"
  Then I press "Artists"
  Then I long press list item number 1
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear input field with id "playlist"
  Then I enter text "From_Artists" into field with id "playlist"
  Then I go back
  Then I press "Save"
  Then I press "Albums"
  Then I press "Playlists"
  And I see "From_Artists"
  Then I long press "From_Artists"
  Then I press "Delete"

Scenario: Add to playlist from Songs tab
  Then I press "icon"
  Then I press "Artists"
  Then I press "Songs"
  Then I long press list item number 1
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear input field with id "playlist"
  Then I enter text "From_Songs" into field with id "playlist"
  Then I go back
  Then I press "Save"
  Then I press "Albums"
  Then I press "Playlists"
  Then I scroll down
  And I see "From_Songs"
  Then I long press "From_Songs"
  Then I press "Delete"

Scenario: Add/Rename/Delete playlists
  Then I press "icon"
  Then I press "Artists"
  Then I press "Songs"
  Then I long press list item number 1
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear input field with id "playlist"
  Then I enter text "Added_playlist" into field with id "playlist"
  Then I go back
  Then I press "Save"
  Then I press "Albums"
  Then I press "Playlists"
  Then I see "Added_playlist"
  Then I long press "Added_playlist"
  Then I press "Rename"
  Then I clear input field with id "playlist"
  Then I enter text "Renamed_playlist" into field with id "playlist"
  Then I go back
  Then I press "Save"
  And I see "Renamed_playlist"
  Then I long press "Renamed_playlist"
  Then I press "Delete"
  Then I don't see "Renamed_playlist"

Scenario: Top layout menu
  Then I press "icon"
  Then I press "topContentContainer"
  Then I press "firstButtonLayout"
  And I see "WebRadio"
  And I see "Driving Mode"    