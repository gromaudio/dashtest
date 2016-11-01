Feature: Spotify
@debug @M
Scenario: Start
  Then I press "skipButton"
  Then I press "button2" 
  Then I press "menu_button"
  Then I press "replace"
  Then I press "PLUGINS"
  Then I press "Spotify"
 
@debug @M
Scenario: Login 
  Then I press "icon"
  Then I wait for 8 seconds
  Then I tap on Log in to Spotify
  Then I enter credentials
  Then I wait for 2 seconds
  Then I press enter button
  Then I wait for 16 seconds
@debug @M
Scenario: Navigation through the Settings
  Then I press "icon"
  Then I wait for 6 seconds
  Then I go back
  Then I press "leftButtonFirst"
  Then I press "Settings"
  Then I see "Spotify Settings"
  Then I see "General"
  Then I see "Gestures"
  And I see "Learn/reassign which gestures do what. Random, Repeat, browse options, extra menus, equalizer and many more is accessible via gestures !"
  When I press "Gestures"
  Then I see "CHANGEABLE ACTIONS"
  #And I see "Show track/station information, file size, bitrate etc"
  And I see "Toggle Random on/off"
  And I see "Return to Library"
  And I see "Next category. Folder, Playlist, Album, Artist"
  And I see "Prev category. Folder, Playlist, Album, Artist"
  Then I see "FIXED ACTIONS"
  #And I see "Previous Track/Station"
  #And I see "Next Track/Station"
  Then I scroll down
  #And I see "Show Playing Now tracks/stations"
  And I see "Update cover art from internet"
  Then I press "leftButtonFirst"
  Then I see "AutoHide Panels"
  And I see "Hide Navigation panels when browsing long lists to free up more space for text data"
  Then I press "AutoHide Panels"
@debug
Scenario: Navigation through the plugin 
  Then I press "icon"
  Then I wait for 6 seconds
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
  Then I go back
  Then I press "Genres and Moods"
  Then I touch the "Releases" text
  Then I press "Charts"
  Then I press "Stations"
  Then I press "leftButtonFirst"
  And I see "Accounts"
  And I see "Settings"
  And I see "About"
  And I see "Exit"
@debug  
Scenario: Check About section
  Then I press "icon"
  Then I wait for 6 seconds
  Then I go back
  Then I press "leftButtonFirst"
  Then I press "About"
  And I see "Spotify plugin for DashLinQ."
  And I see "Copyright GROM Audio 2015"
@debug
Scenario: Exit check
  Then I press "icon"
  Then I wait for 6 seconds
  Then I go back
  Then I press "leftButtonFirst"
  Then I press "Exit"
  Then I see "Where is My Car"
  Then I see "WebRadio"

#STATIONS TAB
@music
Scenario: Play/Pause Music
  Then I press "icon"
  Then I wait for 8 seconds
  Then I go back
  Then I wait for 1 seconds
  Then I press "Acoustic"
  Then I wait for 5 seconds
  Then I press image view number 3
  Then I wait for 2 seconds
  Then I press "slide_panel_now_playing_title"
  Then I wait for 1 seconds
  Then I wait for start
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I wait for 1 second
  Then I go back
  # Long press play
  Then I wait for 1 second
  Then I long press image view number 6
  Then I press "Play"
  Then I wait for 2 seconds
  Then I press "slide_panel_now_playing_title"
  Then I wait for 1 seconds
  Then I wait for start
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I wait for 1 second
  Then I go back
  Then I wait for 1 second
  Then I go back

@debug
Scenario: Add/Delete to playlist/favorite
  Then I press "icon"
  Then I wait for 8 seconds
  Then I go back
  Then I wait for 1 seconds
  Then I press "Afrobeat"
  Then I wait for 5 seconds
  Then I get text for item number 3
  Then I long press image view number 3
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "From_Stations"
  # To hide keyboard
  Then I go back
  Then I press "Save"
  Then I wait for 1 second
  
  Then I long press image view number 3
  Then I press "Add to favorites"
  Then I wait for 1 second
  Then I go back
  Then I press "Charts"
  Then I press "New Releases"
  Then I touch the "Genres" text
  Then I touch the "Your" text

  Then I press "Playlists"
  And I see "From_Stations"
  Then I press "From_Stations"
  Then I see item number text
  Then I go back
  Then I long press "From_Stations"
  And I press "Delete"
  Then I wait for 2 seconds
  Then I don't see "From_Stations"
  Then I go back

  Then I press "Songs"
  Then I see item number text
  Then I go back

  Then I press "Albums"
  Then I press element number 3
  Then I see item number text
  Then I go back
  Then I wait for 1 second
  Then I go back

  Then I press "Artists"
  Then I press image view number 1
  Then I press image view number 3
  Then I see item number text
  Then I go back
  Then I wait for 1 second
  Then I go back

  Then I press "Songs"
  Then I long press previously added element
  Then I press "Delete from favorites"
  Then I wait for 3 seconds
  And I see "No elements"
  Then I go back
  And I see "0 albums"
  And I see "0 artists"
  Then I press "Genres and Moods"
  Then I touch the "Releases" text
  Then I press "Charts"
  Then I press "Stations"

#CHARTS TAB
@music
Scenario: Play/Pause Music
  Then I press "icon"
  Then I wait for 8 seconds
  Then I go back
  Then I press "Charts"
  And I press "Rap Caviar"
  Then I wait for 4 seconds
  Then I press image view number 1
  Then I wait for 2 seconds
  Then I press "slide_panel_now_playing_title"
  Then I wait for 1 seconds
  Then I wait for start
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I wait for 1 second
  Then I go back
  # Long press play
  Then I wait for 1 second
  Then I long press image view number 4
  Then I press "Play"
  Then I wait for 2 seconds
  Then I press "slide_panel_now_playing_title"
  Then I wait for 1 seconds
  Then I wait for start
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I wait for 1 second
  Then I go back
  Then I wait for 1 second
  Then I go back
  # Long press on folder play
  Then I long press "Rap Caviar"
  Then I press "Play"
  Then I wait for 2 seconds
  Then I press "slide_panel_now_playing_title"
  Then I wait for 1 seconds
  Then I wait for start
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I wait for 1 second
  Then I press "Stations"

@debug
Scenario: Check "Charts" tab 
  Then I press "icon"
  Then I wait for 8 seconds
  Then I go back
  Then I press "Charts"
  Then I drag from 50:30 to 50:300 moving with 20 steps
  And I see "Today\'s Top Hits"
  And I see "Rap Caviar"
  Then I scroll to "electroNOW" text
  Then I scroll to "Rock This" text
  Then I scroll to "Are & Be" text
  Then I scroll to "Viva Latino" text
  Then I scroll to "Hot Country" text
  Then I scroll to "New Music Friday" text
  Then I scroll to "Viral Hits" text
  Then I scroll to "Fresh Finds" text
  Then I drag from 50:30 to 50:300 moving with 20 steps
  Then I press "Stations"
@debug
Scenario: Follow Charts 
  Then I press "icon"
  Then I wait for 8 seconds
  Then I go back
  Then I press "Charts"
  # Save as playlist
  Then I long press "Rap Caviar"
  Then I press "Follow"
  Then I press "New Releases"
  Then I touch the "Genres" text
  Then I touch the "Your" text
  Then I press "Playlists"
  And I see "Rap Caviar"
  Then I long press "Rap Caviar"
  And I press "Unfollow"
  Then I wait for 2 seconds
  Then I don't see "Rap Caviar"
  Then I press "actionBackArrow"
  Then I press "Genres and Moods"
  Then I touch the "Releases" text
  Then I press "Charts"
  Then I press "Stations"

@debug
Scenario: Add/Delete to playlist/favorite 
  Then I press "icon"
  Then I wait for 8 seconds
  Then I go back
  Then I press "Charts"
  Then I press "Rap Caviar"
  Then I wait for 5 seconds
  Then I get text for item number 1
  Then I long press image view number 1
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "From_Charts"
  # To hide keyboard
  Then I go back
  Then I press "Save"
  Then I wait for 1 second
  Then I long press image view number 1
  Then I press "Add to favorites"
  Then I wait for 1 second
  Then I go back
  Then I press "New Releases"
  Then I touch the "Genres" text
  Then I touch the "Your" text
  Then I press "Playlists"
  And I see "From_Charts"
  Then I press "From_Charts"
  Then I see item number text
  Then I go back
  Then I long press "From_Charts"
  And I press "Delete"
  Then I wait for 2 seconds
  Then I don't see "From_Charts"
  Then I go back

  Then I press "Songs"
  Then I see item number text
  Then I go back

  Then I press "Albums"
  Then I press element number 3
  Then I see item number text
  Then I go back
  Then I wait for 1 second
  Then I go back

  Then I press "Artists"
  Then I press image view number 1
  Then I press image view number 3
  Then I see item number text
  Then I go back
  Then I wait for 1 second
  Then I go back

  Then I press "Songs"
  Then I long press previously added element
  Then I press "Delete from favorites"
  Then I wait for 3 seconds
  And I see "No elements"
  Then I go back
  And I see "0 albums"
  And I see "0 artists"

  Then I press "Genres and Moods"
  Then I touch the "Releases" text
  Then I press "Charts"
  Then I press "Stations"

#NEW RELEASES TAB 

@music
Scenario: Play/Pause Music
  Then I press "icon"
  Then I wait for 8 seconds
  Then I go back
  Then I press "New Releases"
  Then I press element number 4
  Then I wait for 5 seconds
  Then I press image view number 1
  Then I wait for 2 seconds
  Then I press "slide_panel_now_playing_title"
  Then I wait for 1 seconds
  Then I wait for start
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I wait for 1 second
  Then I go back
  Then I wait for 1 second
  Then I go back
  # Long press play
  Then I wait for 1 second
  Then I press element number 1
  Then I press image view number 1
  Then I press "Play"
  Then I wait for 2 seconds
  Then I press "slide_panel_now_playing_title"
  Then I wait for 1 seconds
  Then I wait for start
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I wait for 1 second
  Then I go back
  Then I wait for 1 second
  Then I go back
  # Long press on folder play
  Then I long press element number 4
  Then I press "Play"
  Then I wait for 2 seconds
  Then I press "slide_panel_now_playing_title"
  Then I wait for 1 seconds
  Then I wait for start
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I go back
  Then I wait for 1 second
  Then I press "Charts"
  Then I press "Stations"

@we
Scenario: Add/Delete to playlist/favorite  
  Then I press "icon"
  Then I wait for 8 seconds
  Then I go back
  Then I press "New Releases"
  Then I press element number 2
  Then I wait for 5 seconds
  Then I get text for item number 1
  Then I long press image view number 1
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "From_New_Releases"
  # To hide keyboard
  Then I go back
  Then I press "Save"
  Then I wait for 1 second
  Then I long press image view number 1
  Then I press "Add to favorites"
  Then I wait for 1 second
  Then I go back
  Then I touch the "Genres" text
  Then I touch the "Your" text
  Then I press "Playlists"
  And I see "From_New_Releases"
  Then I press "From_New_Releases"
  Then I see item number text
  Then I go back
  Then I long press "From_New_Releases"
  And I press "Delete"
  Then I wait for 2 seconds
  Then I don't see "From_New_Releases"
  Then I go back

  Then I press "Songs"
  Then I see item number text
  Then I go back

  Then I press "Albums"
  Then I press element number 3
  Then I see item number text
  Then I go back
  Then I wait for 1 second
  Then I go back

  Then I press "Artists"
  Then I press image view number 1
  Then I press image view number 3
  Then I see item number text
  Then I go back
  Then I wait for 1 second
  Then I go back

  Then I press "Songs"
  Then I long press previously added element
  Then I press "Delete from favorites"
  Then I wait for 3 seconds
  And I see "No elements"
  Then I go back
  And I see "0 albums"
  And I see "0 artists"

  Then I press "Genres and Moods"
  Then I touch the "Releases" text
  Then I press "Charts"
  Then I press "Stations"


#GENRES AND MOODS TAB 

@music
Scenario: Play/Pause Music
  Then I press "icon"
  Then I wait for 8 seconds
  Then I go back
  Then I press "New Releases"
  Then I touch the "Genres" text
  Then I press "Party"
  Then I wait for 5 seconds
  Then I press element number 4
  Then I wait for 5 seconds
  Then I press image view number 1
  Then I wait for 2 seconds
  Then I press "slide_panel_now_playing_title"
  Then I wait for 1 seconds
  Then I wait for start
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I wait for 1 second
  Then I go back
  # Long press play
  Then I wait for 1 second
  Then I long press image view number 4
  Then I press "Play"
  Then I wait for 2 seconds
  Then I press "slide_panel_now_playing_title"
  Then I wait for 1 seconds
  Then I wait for start
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I wait for 1 second
  Then I go back
  Then I wait for 1 second
  Then I go back
  # Long press on folder play
  Then I long press element number 4
  Then I press "Play"
  Then I wait for 2 seconds
  Then I press "slide_panel_now_playing_title"
  Then I wait for 1 seconds
  Then I wait for start
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I wait for 1 second
  Then I go back
  Then I press "New Releases"
  Then I press "Charts"
  Then I press "Stations"

@qw
Scenario: Add/Delete to playlist/favorite  
  Then I press "icon"
  Then I wait for 8 seconds
  Then I go back
  Then I press "New Releases"
  Then I touch the "Genres" text
  Then I press "Party"
  Then I wait for 5 seconds
  Then I press element number 4
  Then I wait for 5 seconds
  Then I get text for item number 1
  Then I long press image view number 1
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "From_Genres"
  # To hide keyboard
  Then I go back
  Then I press "Save"
  Then I wait for 1 second
  Then I long press image view number 1
  Then I press "Add to favorites"
  Then I wait for 1 second
  Then I go back
  Then I wait for 1 second
  Then I go back
  Then I touch the "Your" text
  Then I press "Playlists"
  And I see "From_Genres"
  Then I press "From_Genres"
  Then I see item number text
  Then I go back
  Then I long press "From_Genres"
  And I press "Delete"
  Then I wait for 2 seconds
  Then I don't see "From_Genres"
  Then I go back

  Then I press "Songs"
  Then I see item number text
  Then I go back

  Then I press "Albums"
  Then I press element number 3
  Then I see item number text
  Then I go back
  Then I wait for 1 second
  Then I go back

  Then I press "Artists"
  Then I press image view number 1
  Then I press image view number 3
  Then I see item number text
  Then I go back
  Then I wait for 1 second
  Then I go back

  Then I press "Songs"
  Then I long press previously added element
  Then I press "Delete from favorites"
  Then I wait for 3 seconds
  And I see "No elements"
  Then I go back
  And I see "0 albums"
  And I see "0 artists"

  Then I press "Genres and Moods"
  Then I touch the "Releases" text
  Then I press "Charts"
  Then I press "Stations"

#YOUR MUSIC TAB
@M
Scenario: Check "Your Music" tab 
  Then I press "icon"
  Then I wait for 6 seconds
  Then I go back
  Then I press "New Releases"
  Then I press "Genres and Moods"
  Then I press "Your Music"
  And I see "Playlists"
  And I see "Songs"
  And I see "Albums"
  And I see "Artists"
  Then I press "Playlists"
  And I see "On The Go"
  Then I go back
  Then I wait for 2 seconds
  Then I press "Genres and Moods"
  Then I touch the "Releases" text
  Then I press "Charts"
  Then I press "Stations"
@M
Scenario: Add to favorite from Playlist
  Then I press "icon"
  Then I wait for 6 seconds
  Then I go back
  Then I press "Charts"
  Then I long press "Rap Caviar"
  Then I press "Follow"
  Then I wait for 1 seconds
  Then I press "New Releases"
  Then I touch the "Genres" text
  Then I press "Your Music"
  Then I press "Playlists"
  Then I press "Rap Caviar"
  Then I wait for 3 seconds
  Then I get text for item number 1
  Then I long press image view number 1
  Then I press "Add to favorites"
  Then I go back
  Then I wait for 1 seconds
  Then I go back

  Then I press "Songs"
  Then I see item number text
  Then I go back

  Then I press "Albums"
  Then I press element number 3
  Then I see item number text
  Then I go back
  Then I wait for 1 seconds
  Then I go back

  Then I press "Artists"
  Then I press image view number 1
  Then I press image view number 3
  Then I see item number text
  Then I go back
  Then I wait for 1 seconds
  Then I go back
@M
Scenario: Add to Playlist from Favorites
  Then I press "icon"
  Then I wait for 6 seconds
  Then I go back
  Then I press "Songs"
  Then I wait for 3 seconds
  Then I get text for item number 1
  Then I long press image view number 1
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "From_favorite"
  # To hide keyboard
  Then I go back
  Then I press "Save"
  Then I wait for 1 second
  Then I go back
  Then I press "Playlists"
  And I see "From_favorite"
  Then I press "From_favorite"
  Then I see item number text
  Then I go back
  Then I long press "From_favorite"
  Then I press "Delete"
  Then I wait for 2 seconds
  Then I don't see "From_favorite"
  Then I go back
@M
Scenario: Play/Pause Music
  Then I press "icon"
  Then I wait for 6 seconds
  Then I go back
  Then I press "Playlists"
  Then I press "Rap Caviar"
  Then I press image view number 4
  Then I wait for 2 seconds
  Then I press "slide_panel_now_playing_title"
  Then I wait for 1 seconds
  Then I wait for start
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I wait for 1 second
  Then I go back
  Then I wait for 1 second
  Then I go back
  # Long press play
  Then I long press "Rap Caviar"
  Then I press "Play"
  Then I wait for 2 seconds
  Then I press "slide_panel_now_playing_title"
  Then I wait for 1 seconds
  Then I wait for start
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I go back
  Then I long press "Rap Caviar"
  Then I press "Unfollow"
  Then I wait for 2 seconds
  Then I don't see "Rap Caviar"
  Then I go back 

  Then I press "Genres and Moods"
  Then I touch the "Releases" text
  Then I press "Charts"
  Then I press "Stations"