Feature: Spotify
@debug
Scenario: Start
  Then I press "skipButton"
  Then I press "button2" 
  Then I press "menu_button"
  Then I press "replace"
  Then I press "PLUGINS"
  Then I press "Spotify"
 
@debug
Scenario: Login 
  Then I press "icon"
  Then I wait for 3 seconds
  Then I tap on login
  Then I enter credentials
  Then I press enter button
  Then I wait for 6 seconds

@debug
Scenario: Check "Your Music" tab 
  Then I press "icon"
  Then I wait for 2 seconds
  Then I go back
  Then I press "New Releases"
  Then I press "Genres and Moods"
  Then I press "Your Music"
  And I see "Songs"
  And I see "Playlists"
  And I see "Albums"
  And I see "Artists"
  And I see "Recently played"
  Then I press "Songs"
  And I see "No elements"
  Then I press "actionBackArrow"
  Then I press "Playlists"
  And I see "On The Go"
  Then I press "actionBackArrow"
  Then I press "Albums"
  And I see "No elements"
  Then I press "actionBackArrow"
  Then I press "Artists"
  And I see "No elements"
  Then I press "actionBackArrow"
  Then I press "Recently played"
  And I see "No elements"
  Then I press "actionBackArrow"

Scenario: Navigation through the plugin 
  Then I press "icon"
  Then I wait for 2 seconds
  Then I go back
  Then I see "Stations"
  Then I see "Charts"
  Then I see "New Releases"
  Then I press "New Releases"
  Then I see "Genres and Moods"
  Then I press "Genres and Moods"
  Then I see "Your Music"
  Then I press "Your Music"
  Then I see "Search"
  Then I press "Search"
  Then I press "search_bar"
  Then I press "leftButtonFirst"
  And I see "Accounts"
  And I see "Settings"
  And I see "About"
  And I see "Exit"
  
Scenario: Navigation through the Settings
  Then I press "icon"
  Then I wait for 4 seconds
  Then I go back
  Then I press "leftButtonFirst"
  Then I press "Settings"
  Then I see "Spotify Settings"
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
  Then I wait for 4 seconds
  Then I go back
  Then I press "leftButtonFirst"
  Then I press "About"
  And I see "Spotify plugin for DashLinQ."
  And I see "Copyright GROM Audio 2015"

 Scenario: Top layout menu
  Then I press "icon"
  Then I wait for 4 seconds
  Then I go back
  Then I press "topContentContainer"
  Then I press "firstButtonLayout"
  And I see "WebRadio"
  And I see "Driving Mode"

Scenario: Top layout menu (Voice commands icon)
  Then I press "icon"
  Then I wait for 4 seconds
  Then I go back
  Then I press "topContentContainer"
  Then I press "thirdButtonLayout"
  And I see "Call"
  And I see "Navigate" 

Scenario: Exit check
  Then I press "icon"
  Then I wait for 4 seconds
  Then I go back
  Then I press "leftButtonFirst"
  Then I press "Exit"
  Then I see "Where is My Car"
  Then I see "WebRadio"