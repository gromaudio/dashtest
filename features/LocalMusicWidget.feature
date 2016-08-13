Feature: Local Music Settings 

Scenario: Media rescan
  Then I press "skipButton"
  Then I press "button2"
  Then I press "icon"
  Then I see "4 songs"
  Then I press "leftButtonFirst"
  Then I press "Settings"
  Then I press "Media Rescan"
  Then I press "leftButtonFirst"
  Then I wait for 5 seconds
  Then I see "4 songs"  

Scenario: Check tabs and About
  Then I press "icon"
  Then I see "Folders"
  Then I see "Playlists"
  Then I see "Albums"
  Then I see "Artists"
  Then I press "Artists"
  Then I see "Songs"
  Then I see "Search"
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
  Then I see "Folders"
  And I see "Music home folder"
  Then I see "Indexing"
  And I see "Media Rescan" 

Scenario: Play Music
  Then I press "icon"
  Then I press "Playlists"
  Then I press "Folders"
  Then I press "Music"
  Then I press list item number 3 
  Then I press "slide_panel_now_playing_title"
  Then I press "pause" 

Scenario: Long press actions (Add/Create)
  Then I press "icon"
  Then I press " .. "
  Then I long press "Music"
  And I see "Play"
  And I see "Add to playlist"
  Then I press "Add to playlist"
  And I see "Add to playlist"
  And I see "Add to On The Go"
  And I see "NEW"
  Then I press "New"
  And I see "Save"
  And I see "Cancel"
  And I see "Music"
  Then I press "Save"
  Then I press "Playlists"
  And I see "Music"
  Then I long press "Music"
  And I see "Play"
  And I see "Add to playlist"
  And I see "Play from the beginning"
  And I see "Play from the saved position"
  And I see "Delete"
  And I see "Rename"
  Then I press "Rename"
  Then I clear "Music"
  Then I enter text "Custome" into field with id "playlist"
  Then I go back
  Then I press "Save"
  And I see "Custome"

Scenario: Delete Playlist
  Then I press "icon"
  Then I press "Folders"
  Then I long press "Music"
  Then I press "Add to playlist"
  Then I press "New"
  Then I press "Save"
  Then I press "Playlists"
  Then I long press "Music"
  Then I press "Delete"
  Then I don't see "Music"

Scenario: Songs tab (View component)
  Then I press "icon"
  Then I press "Artists"
  Then I press "Songs"
  Then I long press list item number 1
  Then I see "Play"
  Then I see "Add to playlist"
  Then I see "Jump to Album"
  Then I see "Jump to Artist"
  Then I see "Jump to Folder"
  Then I see "Update cover art"  

Scenario: Songs tab (Functionality)
  Then I press "icon"
  Then I press "Artists"
  Then I press "Songs"
  Then I long press list item number 2
  Then I press "Jump to Album"
  And I see "1000.mp3"
  Then I wait for 2 seconds
  Then I go back
  Then I press "Songs"
  Then I long press list item number 2
  Then I press "Jump to Artist"
  Then I wait for 2 seconds
  And I see "Unknown artist"
  Then I press "Songs"
  Then I long press list item number 2
  Then I press "Jump to Folder"
  Then I see "1000.mp3"
  Then I press " .. "
  Then I press " .. "
  Then I press " .. "
  And I see "Music"  

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
  Then I don't see "From_Albums"
   
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
  Then I don't see "From_Artists"

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
  Then I don't see "From_Songs"

Scenario: Top layout menu
  Then I press "icon"
  Then I press "topContentContainer"
  Then I press "firstButtonLayout"
  And I see "WebRadio"
  And I see "Driving Mode"  