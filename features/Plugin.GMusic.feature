Feature: GMusic
@debug
Scenario: Start
  Then I press "skipButton"
  Then I press "button2" 
  Then I press "menu_button"
  Then I press "replace"
  Then I press "PLUGINS"
  Then I press "GMusic"
@debug
Scenario: Navigation through the plugin
  Then I press "icon"
  Then I wait for 3 seconds
  Then I press item with name "dashlinqbetatest@gmail.com"
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
  Then I swipe to up
  And I see "Exit"
  Then I swipe to down

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

Scenario: Check Albums tab
  Then I press "icon"
  Then I press "Albums"
  When I press "Adele"
  And I see "Adele - 21"
  And I see "Rolling In The Deep"
  And I see "1/4 3:48"
  And I see "Rumor Has It"
  And I see "2/4 3:43"
  And I see "He Won\'t Go"
  And I see "3/4 4:37"
  And I see "Lovesong"
  And I see "4/4 5:16"
  Then I go back

  When I press "Buffy"
  And I see "Buffy First Love"
  And I see "2 Find U"
  And I see "1/4 3:52"
  And I see "Someday"
  And I see "2/4 4:19"
  And I see "I Miss You"
  And I see "3/4 5:04"
  And I see "First Love"
  And I see "4/4 5:05"
  Then I go back

  Then I scroll down
  When I press "Adam Lambert"
  And I see "For Your Entertainment"
  And I see "Music Again"
  And I see "1/4 3:16"
  And I see "Strut"
  And I see "2/4 3:29"
  And I see "Soaked"
  And I see "3/4 4:33"
  And I see "Fever"
  And I see "4/4 3:26"
  Then I go back

  Then I scroll down
  When I press "Fleetwood Mac"
  And I see "Greatest Hits"
  And I see "Gypsy"
  And I see "1/4 4:24"
  And I see "Dreams"
  And I see "2/4 4:14"
  And I see "Tusk"
  And I see "3/4 3:30"
  And I see "Sara"
  And I see "4/4 6:21"
  Then I go back

  Then I scroll down
  When I press "Queen"
  And I see "A Kind Of Magic"
  And I see "Queen - A Kind Of Magic"
  And I see "1/4 4:24"
  And I see "One Vision"
  And I see "2/4 5:11"
  And I see "Forever"
  And I see "3/4 3:20"
  And I see "One Year Of Love"
  And I see "4/4 4:27"
  Then I go back
  Then I scroll up
  Then I press "Playlists"

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

  Then I see "Buffy"
  When I press "Buffy"
  And I see "Buffy First Love"
  And I see "4 songs"
  Then I press "Buffy"

  Then I scroll down
  And I see "Fleetwood Mac"
  When I press "Fleetwood Mac"
  And I see "Greatest Hits"
  And I see "4 songs"
  Then I press "Fleetwood Mac"

  Then I see "Queen"
  When I press "Queen"
  Then I see "A Kind Of Magic"
  And I see "4 songs"
  Then I press "Queen"
  Then I scroll up
  Then I press "Albums"
  Then I press "Playlists"

Scenario: Check Songs tab
  Then I press "icon"
  Then I press "Artists"
  Then I press "Songs"
  And I see "2 Find U"
  And I see "Buffy - Buffy First Love"
  And I see "1/20 3:52"

  And I see "Dreams"
  And I see "Fleetwood Mac - Greatest Hits"
  And I see "2/20 4:14"

  And I see "Fever"
  And I see "Adam Lambert - For"
  And I see "3/20 3:26"

  And I see "First Love"
  And I see "Buffy - Buffy First Love"
  And I see "4/20 5:05"

  Then I scroll down
  And I see "Forever"
  And I see "Queen - A Kind Of Magic"
  And I see "5/20 3:20"

  And I see "Gypsy"
  And I see "Fleetwood Mac - Greatest Hits"
  And I see "6/20 4:24"

  And I see "He Won\'t Go"
  And I see "Adele - Adele - 21"
  And I see "7/20 4:37"

  And I see "I Miss You"
  And I see "Buffy - Buffy First Love"
  And I see "8/20 5:04"

  Then I scroll down
  And I see "A Kind Of Magic"
  And I see "Queen - A Kind Of Magic"
  And I see "9/20 4:24"

  And I see "Lovesong"
  And I see "Adele - Adele - 21"
  And I see "10/20 5:16"

  And I see "Music Again"
  And I see "Adam Lambert - For"
  And I see "11/20 3:16"

  And I see "One Vision"
  And I see "Queen - A Kind Of Magic"
  And I see "12/20 5:11"

  Then I scroll down
  And I see "One Year Of Love"
  And I see "Queen - A Kind Of Magic"
  And I see "13/20 4:27"

  And I see "Rolling In The Deep"
  And I see "Adele - Adele - 21"
  And I see "14/20 3:48"

  And I see "Rumor Has It"
  And I see "Adele - Adele - 21"
  And I see "15/20 3:43"

  And I see "Sara"
  And I see "Fleetwood Mac - Greatest Hits"
  And I see "16/20 6:21"

  Then I scroll down
  And I see "Soaked"
  And I see "Adam Lambert - For"
  And I see "17/20 4:33"

  And I see "Someday"
  And I see "Buffy - Buffy First Love"
  And I see "18/20 4:19"

  And I see "Strut"
  And I see "Adam Lambert - For"
  And I see "19/20 3:29"

  And I see "Tusk"
  And I see "Fleetwood Mac - Greatest Hits"
  And I see "20/20 3:30"

  Then I scroll up
  Then I scroll up
  Then I scroll up
  Then I scroll up
  Then I scroll up
  Then I press "Artists"
  Then I press "Albums"
  Then I press "Playlists"

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

Scenario: Jum to Album/Artist options from Songs tab
  Then I press "icon"
  Then I press "Artists"
  Then I press "Songs"
  Then I long press "2 First U"
  Then I press "Jump to Album"
  Then I see "Buffy First Love"
  Then I see "2 First U"
  And I see "Someday"
  And I see "I Miss You"
  And I see "First Love"
  Then I go back 
  Then I press "Songs"
  Then I long press "2 First U"
  Then I press "Jump to Artist"
  And I see "Buffy First Love"
  And I see "4 songs"
  Then I press "Buffy"
  Then I scroll up 
  Then I press "Albums"
  Then I press "Playlists" 

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

Scenario: Top layout menu (Home icon)
  Then I press "icon"
  Then I wait for 2 seconds
  Then I press "topContentContainer"
  Then I press "firstButtonLayout"
  And I see "WebRadio"
  And I see "Driving Mode"  

Scenario: Top layout menu (Voice commands icon)
  Then I press "icon"
  Then I wait for 2 seconds
  Then I press "topContentContainer"
  Then I press "thirdButtonLayout"
  And I see "Call"
  And I see "Navigate" 

Scenario: Exit option
  Then I press "icon"
  Then I press "leftButtonFirst"
  Then I scroll to up
  Then I press "Exit"
  Then I see "Where is My Car"
  Then I see "WebRadio"  