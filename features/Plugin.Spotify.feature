Feature: Spotify
@a
Scenario: Start
  Then I press "closeButton"
  Then I press "button2" 
  Then I press "menu_button"
  Then I press "replace"
  Then I press "PLUGINS"
  Then I press "Spotify"
  Then I wait for 1 second

Scenario: Check background text
  Then I press "icon"
  Then I wait for 3 seconds
  Then I press "Stations"
  And I see "You need to login to use the services. Use Options->Accounts"
  Then I press "Charts"
  And I see "You need to login to use the services. Use Options->Accounts"
  Then I press "New Releases"
  And I see "You need to login to use the services. Use Options->Accounts"
  Then I press "Genres and Moods"
  And I see "You need to login to use the services. Use Options->Accounts"
  Then I press "Your Music"
  Then I press "Playlists"
  And I see "0 items"
  Then I go back
  Then I press "Songs"
  And I see "There are no items found in Songs"
  Then I go back
  Then I press "Albums"
  And I see "0 items"
  Then I go back
  Then I press "Artists"
  And I see "0 items"
  Then I go back
  Then I press "Search"
  And I see "Enter keyword or phrase to search"
  Then I press "Your Music"
  Then I press "Genres and Moods"
  Then I press "New Releases"
  Then I press "Charts"
  Then I press "Stations"
@a
Scenario: Login 
  Then I press "icon"
  Then I wait for 3 seconds
  Then I press "leftButtonFirst"
  Then I press "Accounts"
  Then I wait for 6 seconds
  Then I tap on Log in to Spotify
  Then I wait for 2 seconds
  Then I touch username field
  Then I enter username
  Then I go back
  Then I wait for 2 seconds
  Then I touch password field
  Then I enter password
  Then I go back
  Then I wait
  Then I press Login button
  Then I wait for 2 seconds
  Then I scroll down
  Then I wait for 2 seconds
  Then I swipe to right
  Then I press Okay button
  Then I wait for 5 seconds

Scenario: Navigation through the Settings
  Then I press "icon"
  Then I wait for 5 seconds
  Then I press "leftButtonFirst"
  Then I press "Settings"
  Then I see "Spotify Settings"
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
  And I see "Previous Track/Station"
  And I see "Next Track/Station"
  Then I scroll to text "Update cover art from internet"
  And I see "Show Playing Now tracks/stations"
  And I see "Update cover art from internet"
  Then I press "leftButtonFirst"
  Then I see "AutoHide Panels"
  And I see "Hide Navigation panels when browsing long lists to free up more space for text data"
  Then I press "AutoHide Panels"

Scenario: Navigation through the plugin
  Then I press "icon"
  Then I wait for 5 seconds
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
  And I see "Log Out"
  And I see "Settings"
  And I see "About"
  Then I swipe to Exit
  And I see "Home"

Scenario: Check About section
  Then I press "icon"
  Then I wait for 5 seconds
  Then I press "leftButtonFirst"
  Then I press "About"
  And I see "Spotify plugin for DashLinQ."
  And I see "Copyright GROM Audio 2015"

Scenario: Exit check
  Then I press "icon"
  Then I wait for 5 seconds
  Then I press "leftButtonFirst"
  Then I swipe to Exit
  Then I press "Home"
  Then I see "Where is My Car"
  Then I see "WebRadio"

#STATIONS TAB

Scenario: Play/Pause Music
  Then I press "icon"
  Then I wait for 5 seconds
  Then I wait for loading "Acoustic"
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

Scenario: Check Repeat and Shuffle option after switch plugin 
  Then I press icon "name" with text "Spotify"
  Then I press "Stations"
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
  Then I press icon "name" with text "Spotify"
  Then I wait
  Then I press "slide_panel_now_playing_title"
  Then I check "shuffle" status "SideButtonLeft On"
  Then I check "repeat" status "SideButtonRight On"
  Then I press "shuffle"
  Then I press "repeat"
  Then I check "shuffle" status "SideButtonLeft Off"
  Then I check "repeat" status "SideButtonRight Off"       

Scenario: Add/Delete to playlist/favorite
  Then I press "icon"
  Then I wait for 5 seconds
  Then I wait for loading "Acoustic"
  Then I press "Afrobeat"
  Then I wait for 5 seconds
  Then I get text for item number 3
  Then I long press image view number 3
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "From_Stations"
  # To hide keyboard
  #Then I go back
  Then I press "Save"
  Then I wait for 2 seconds
  
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
  #Then I scroll down

  Then I wait for 1 second
  Then I press "Albums"
  Then I wait for 2 seconds
  Then I press on folder
  Then I see item number text
  Then I go back
  Then I wait for 1 second
  Then I go back
  
  Then I press "Artists"
  Then I wait for 2 seconds
  Then I press image view number 1
  Then I press image view number 3
  Then I see item number text
  Then I go back
  Then I wait for 1 second
  Then I go back
  #Then I scroll up

  Then I press "Songs"
  Then I long press previously added element
  Then I press "Delete from favorites"
  Then I wait for 3 seconds
  #And I see "No elements"

  Then I go back
  Then I press "Genres and Moods"
  Then I touch the "Releases" text
  Then I press "Charts"
  Then I press "Stations"

#CHARTS TAB

Scenario: Play/Pause Music
  Then I press "icon"
  Then I wait for 5 seconds
  Then I press "Charts"
  Then I wait for loading "RapCaviar"
  And I press "RapCaviar"
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
  Then I long press "RapCaviar"
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

Scenario: Check "Charts" tab 
  Then I press "icon"
  Then I wait for 5 seconds
  Then I press "Charts"
  Then I wait for loading "RapCaviar"
  And I see "Today\'s Top Hits"
  And I see "RapCaviar"
  #Then I scroll to "electroNOW" text
  Then I scroll to "mint" text
  Then I scroll to "Rock This" text
  Then I scroll to "Are & Be" text
  Then I scroll to "Viva Latino-Top 50" text
  Then I scroll to "Hot Country" text
  #Then I scroll to "New Music Friday" text
  Then I scroll to "Viral Hits" text
  Then I scroll to "Fresh Finds" text
  Then I scroll to "Global Top 50" text
  Then I scroll to "Global Viral 50" text
  Then I scroll to "United States Top 50" text
  Then I drag from 50:30 to 50:300 moving with 20 steps
  Then I press "Stations"

Scenario: Follow Charts 
  Then I press "icon"
  Then I wait for 5 seconds
  Then I press "Charts"
  Then I wait for loading "RapCaviar"
  # Save as playlist
  Then I long press "RapCaviar"
  Then I press "Follow"
  Then I press "New Releases"
  Then I touch the "Genres" text
  Then I touch the "Your" text
  Then I press "Playlists"
  And I see "RapCaviar"
  Then I long press "RapCaviar"
  And I press "Unfollow"
  Then I wait for 2 seconds
  Then I don't see "RapCaviar"
  Then I go back
  Then I press "Genres and Moods"
  Then I touch the "Releases" text
  Then I press "Charts"
  Then I press "Stations"

Scenario: Add/Delete to playlist/favorite 
  Then I press "icon"
  Then I wait for 5 seconds
  Then I press "Charts"
  Then I wait for loading "RapCaviar"
  Then I press "RapCaviar"
  Then I wait for 5 seconds
  Then I get text for item number 1
  Then I long press image view number 1
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "From_Charts"
  # To hide keyboard
  #Then I go back
  Then I press "Save"
  Then I wait for 2 seconds
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
  Then I wait for 2 seconds
  Then I long press "From_Charts"
  And I press "Delete"
  Then I wait for 2 seconds
  Then I don't see "From_Charts"
  Then I go back

  Then I press "Songs"
  Then I see item number text
  Then I go back
  #Then I scroll down

  Then I press "Albums"
  Then I wait for 2 seconds
  Then I press on folder
  Then I see item number text
  Then I press "actionBackArrow"
  Then I wait for 1 second
  Then I press "actionBackArrow"

  Then I press "Artists"
  Then I wait for 2 seconds
  Then I press image view number 1
  Then I press image view number 3
  Then I see item number text
  Then I press "actionBackArrow"
  Then I wait for 1 second
  Then I press "actionBackArrow"
  #Then I scroll up

  Then I press "Songs"
  Then I long press previously added element
  Then I press "Delete from favorites"
  Then I wait for 3 seconds
  #And I see "No elements"
  Then I go back
  Then I press "Genres and Moods"
  Then I touch the "Releases" text
  Then I press "Charts"
  Then I press "Stations"

#NEW RELEASES TAB 

Scenario: Play/Pause Music
  Then I press "icon"
  Then I wait for 5 seconds
  Then I press "New Releases"
  Then I wait for 2 seconds
  Then I press element number 1
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
  Then I wait for 2 seconds
  Then I press element number 2
  Then I wait for 2 seconds
  Then I long press image view number 1
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
  Then I long press element number 1
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

Scenario: Add/Delete to playlist/favorite  
  Then I press "icon"
  Then I wait for 5 seconds
  Then I press "New Releases"
  Then I press element number 1
  Then I wait for 5 seconds
  Then I get text for item number 1
  Then I long press image view number 1
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "From_New_Releases"
  # To hide keyboard
  #Then I go back
  Then I press "Save"
  Then I wait for 2 seconds
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
  #Then I scroll down

  Then I press "Albums"
  Then I wait for 2 seconds
  Then I press on folder
  Then I see item number text
  Then I go back
  Then I wait for 1 second
  Then I go back

  Then I press "Artists"
  Then I wait for 2 seconds
  Then I press image view number 1
  Then I press image view number 3
  Then I see item number text
  Then I go back
  Then I wait for 1 second
  Then I go back
  #Then I scroll up

  Then I press "Genres and Moods"
  Then I touch the "Releases" text
  Then I press element number 2
  Then I press image view number 1
  Then I go back
  Then I wait for 1 second
  Then I touch the "Genres" text
  Then I touch the "Your" text

  Then I press "Songs"
  Then I long press previously added element
  Then I press "Delete from favorites"
  Then I wait for 3 seconds
  #And I see "No elements"
  Then I go back
  Then I press "Genres and Moods"
  Then I touch the "Releases" text
  Then I press "Charts"
  Then I press "Stations"

#GENRES AND MOODS TAB 

Scenario: Save scroll position
  Then I press "icon"
  Then I wait for 5 seconds
  Then I press "New Releases"
  Then I touch the "Genres" text
  Then I wait for 1 second
  Then I full scroll down
  Then I full scroll down
  Then I press "Funk"
  Then I press " .. "
  And I see "Funk"
  And I see "Punk"
  And I see "Comedy"
  Then I drag from 50:30 to 50:300 moving with 20 steps
  Then I press "New Releases"
  Then I press "Charts"
  Then I press "Stations"

Scenario: Play/Pause Music
  Then I press "icon"
  Then I wait for 5 seconds
  Then I press "New Releases"
  Then I touch the "Genres" text
  Then I wait for loading "Chill"
  Then I press "Chill"
  Then I wait for 5 seconds
  Then I press element number 2
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
  Then I long press element number 2
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

Scenario: Add/Delete to playlist/favorite  
  Then I press "icon"
  Then I wait for 5 seconds
  Then I press "New Releases"
  Then I touch the "Genres" text
  Then I wait for loading "Chill"
  Then I press "Chill"
  Then I wait for 5 seconds
  Then I press element number 2
  Then I wait for 5 seconds
  Then I get text for item number 1
  Then I long press image view number 1
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "From_Genres"
  # To hide keyboard
  #Then I go back
  Then I press "Save"
  Then I wait for 2 seconds
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
  Then I wait for 1 second
  And I press "Delete"
  Then I wait for 2 seconds
  Then I don't see "From_Genres"
  Then I go back

  Then I press "Songs"
  Then I see item number text
  Then I go back
  #Then I scroll down

  Then I press "Albums"
  Then I wait for 2 seconds
  Then I press on folder
  Then I see item number text
  Then I go back
  Then I wait for 1 second
  Then I go back

  Then I press "Artists"
  Then I wait for 2 seconds
  Then I press image view number 1
  Then I press image view number 3
  Then I see item number text
  Then I go back
  Then I wait for 1 second
  Then I go back
  #Then I scroll up

  Then I press "Songs"
  Then I long press previously added element
  Then I press "Delete from favorites"
  Then I wait for 3 seconds
  #And I see "No elements"
  Then I go back

  Then I press "Genres and Moods"
  Then I touch the "Releases" text
  Then I press "Charts"
  Then I press "Stations"

#YOUR MUSIC TAB
@app
Scenario: Check "Your Music" tab 
  Then I press "icon"
  Then I wait for 5 seconds
  Then I press "New Releases"
  Then I press "Genres and Moods"
  Then I press "Your Music"
  And I see "Playlists"
  And I see "Songs"
  #Then I scroll down
  And I see "Albums"
  And I see "Artists"
  #Then I scroll up
  Then I press "Playlists"
  And I see "On The Go"
  Then I go back
  Then I wait for 2 seconds
  Then I press "Genres and Moods"
  Then I touch the "Releases" text
  Then I press "Charts"
  Then I press "Stations"
@app
Scenario: Add to favorite from Playlist
  Then I press "icon"
  Then I wait for 5 seconds
  Then I press "Charts"
  Then I long press "RapCaviar"
  Then I press "Follow"
  Then I wait for 1 seconds
  Then I press "New Releases"
  Then I touch the "Genres" text
  Then I press "Your Music"
  Then I press "Playlists"
  Then I press "RapCaviar"
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
  #Then I scroll down

  Then I press "Albums"
  Then I wait for 2 seconds
  Then I press on folder
  Then I see item number text
  Then I go back
  Then I wait for 1 seconds
  Then I go back

  Then I press "Artists"
  Then I wait for 2 seconds
  Then I press image view number 1
  Then I press image view number 3
  Then I see item number text
  Then I go back
  Then I wait for 1 seconds
  Then I go back
  #Then I scroll up
@app
Scenario: Add to Playlist from Favorites
  Then I press "icon"
  Then I wait for 5 seconds
  Then I press "Songs"
  Then I wait for 3 seconds
  Then I get text for item number 1
  Then I long press image view number 1
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "From_favorite"
  # To hide keyboard
  #Then I go back
  Then I press "Save"
  Then I wait for 2 seconds
  Then I long press image view number 1
  Then I press "Delete from favorites"
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
@app
Scenario: Play/Pause Music
  Then I press "icon"
  Then I wait for 5 seconds
  Then I press "Playlists"
  Then I press "RapCaviar"
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
  Then I long press "RapCaviar"
  Then I press "Play"
  Then I wait for 2 seconds
  Then I press "slide_panel_now_playing_title"
  Then I wait for 1 seconds
  Then I wait for start
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I go back
  Then I long press "RapCaviar"
  Then I press "Unfollow"
  Then I wait for 2 seconds
  Then I don't see "RapCaviar"
  Then I press "Playlists"

  Then I press "Genres and Moods"
  Then I touch the "Releases" text
  Then I press "Charts"
  Then I press "Stations"
@app
Scenario: Add to Playlist from Search tab
  Then I press "icon"
  Then I press "New Releases"
  Then I touch the "Genres" text
  Then I press "Your Music"
  Then I press "Search" 
  Then I press "search_bar"
  Then I enter text "Bring Me To"
  Then I wait for 5 seconds
  Then I see "Bring Me To Life"
  Then I press "Bring Me To Life"
  Then I long press "Evanescence - Fallen"
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "From_Search"
  # To hide keyboard
  Then I go back
  Then I wait for 2 seconds
  Then I press "Save"
  Then I long press "Evanescence - Fallen"
  Then I wait for 1 second
  Then I press "Add to favorites"
  Then I press "Your Music"
  Then I press "Playlists"
  And I see "From_Search"
  Then I long press "From_Search"
  Then I wait for 2 seconds
  Then I press "Delete"
  Then I press "Playlists"

  Then I press "Artists"
  Then I wait for 2 seconds
  Then I press image view number 1
  Then I press image view number 3
  Then I see "Bring Me To Life"
  Then I go back
  Then I wait for 1 seconds
  Then I go back

  Then I press "Albums"
  Then I wait for 2 seconds
  Then I press on folder
  Then I see "Bring Me To Life"
 
  Then I go back
  Then I wait for 1 seconds
  Then I go back

  Then I press "Songs"
  And I see "Bring Me To Life"
  And I see "Evanescence"
  #Then I long press "Bring Me To Life"
  #Then I wait for 1 seconds
  #Then I press "Delete from favorites"
  Then I wait for 2 seconds
  Then I go back
 
  Then I press "Genres and Moods"
  Then I touch the "Releases" text
  Then I press "Charts"
  Then I press "Stations"
@a
Scenario: Long press actions - Add to the On The Go playlist from Genres and Moods tab
  Then I press "icon"
  Then I wait for 10 seconds
  Then I press "Charts"
  Then I press "New Releases"
  Then I press "Genres and Moods"
  Then I press "Chill"
  Then I wait for loading "Brain Food"
  Then I press "Brain Food"
  Then I long press image view number 3
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear input field with id "playlist"
  Then I enter text "On_the_Go_Moods"
  Then I go back
  Then I press "Save"
  Then I press image view number 4
  Then I get text for item number 4
  Then I long press image view number 4
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press Add to On The Go button
  Then I go back
  Then I press "Your Music"
  Then I press "Playlists"
  Then I press "On The Go"
  Then I full scroll down
  Then I wait for 2 seconds
  Then I see item number text
  Then I go back
  Then I long press "On_the_Go_Moods"
  Then I wait for 1 second
  Then I press "Delete"
  Then I wait for 1 second
  Then I don't see "On_the_Go_Moods"
  Then I go back
  Then I press "Genres and Moods"
  Then I press "New Releases"
  Then I press "Charts"
  Then I press "Stations"
  Then I wait for 2 seconds

@a
Scenario: Long press actions - Add to the On The Go playlist from New Releases tab
  Then I press "icon"
  Then I press "Charts"
  Then I press "New Releases"
  Then I wait
  Then I press element number 1
  Then I long press image view number 2
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear input field with id "playlist"
  Then I enter text "On_the_Go_Releases"
  Then I go back
  Then I press "Save"
  Then I press image view number 1
  Then I get text for item number 1
  Then I long press image view number 1
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press Add to On The Go button
  Then I go back
  Then I press "Genres and Moods"
  Then I press "Your Music"
  Then I press "Playlists"
  Then I press "On The Go"
  Then I full scroll down
  Then I wait for 2 seconds
  Then I see item number text
  Then I go back
  Then I long press "On_the_Go_Releases"
  Then I press "Delete"
  Then I wait for 1 second
  Then I don't see "On_the_Go_Releases"
  Then I go back
  Then I press "Genres and Moods"
  Then I press "New Releases"
  Then I press "Charts"
  Then I press "Stations"

@a
Scenario: Long press actions - Add to the On The Go playlist from Charts tab
  Then I press "icon"
  Then I press "Charts"
  Then I wait
  Then I press image view number 1
  Then I long press image view number 1
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear input field with id "playlist"
  Then I enter text "On_the_Go_Charts"
  Then I go back
  Then I press "Save"
  Then I press image view number 1
  Then I get text for item number 1
  Then I long press image view number 1
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press Add to On The Go button
  Then I go back
  Then I press "New Releases"
  Then I press "Genres and Moods"
  Then I press "Your Music"
  Then I press "Playlists"
  Then I press "On The Go"
  Then I full scroll down
  Then I wait for 2 seconds
  Then I see item number text
  Then I go back
  Then I long press "On_the_Go_Charts"
  Then I press "Delete"
  Then I wait for 1 second
  Then I don't see "On_the_Go_Charts"
  Then I go back
  Then I press "Genres and Moods"
  Then I press "New Releases"
  Then I press "Charts"
  Then I press "Stations"
  @a
Scenario: Long press actions - Add to the On The Go playlist from Stations tab
  Then I press "icon"
  Then I press "Stations"
  Then I wait
  Then I press "Acoustic"
  Then I long press image view number 3
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear input field with id "playlist"
  Then I enter text "On_the_Go_Stations"
  Then I go back
  Then I press "Save"
  Then I press image view number 3
  Then I get text for item number 3
  Then I long press image view number 3
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press Add to On The Go button
  Then I go back
  Then I press "Charts"
  Then I press "New Releases"
  Then I press "Genres and Moods"
  Then I press "Your Music"
  Then I press "Playlists"
  Then I press "On The Go"
  Then I full scroll down
  Then I wait for 2 seconds
  Then I see item number text
  Then I go back
  Then I long press "On_the_Go_Stations"
  Then I press "Delete"
  Then I wait for 1 second
  Then I don't see "On_the_Go_Stations"
  Then I go back
  Then I press "Genres and Moods"
  Then I press "New Releases"
  Then I press "Charts"
  Then I press "Stations"

  @a
  Scenario: Long press actions - Add to the On The Go playlist from Search tab
  Then I press "icon"
  Then I press "Charts"
  Then I press "New Releases"
  Then I press "Genres and Moods"
  Then I press "Your Music"
  Then I press "Search"
  Then I press "search_bar"
  Then I enter text "Despasit"
  Then I wait for 5 seconds
  Then I see "Despasito"
  Then I press "Despasito"
  Then I long press "Angeliz - Despasito"
  Then I wait for 1 second
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear input field with id "playlist"
  Then I enter text "On_the_Go_Search"
  Then I go back
  Then I press "Save"
  Then I long press "Angeliz - Despasito"
  Then I press "Add to playlist"
  Then I press Add to On The Go button
  Then I press "Your Music"
  Then I press "Playlists"
  Then I press "On The Go"
  Then I full scroll down
  Then I wait for 2 seconds
  Then I see "Despasito"
  Then I go back
  Then I long press "On_the_Go_Search"
  Then I press "Delete"
  Then I wait for 1 second
  Then I don't see "On_the_Go_Search"
  Then I go back
  Then I press "Your Music"
  Then I press "Genres and Moods"
  Then I press "New Releases"
  Then I press "Charts"
  Then I press "Stations"

Scenario: Logout
  Then I press "icon"
  Then I wait for 5 seconds
  Then I press "leftButtonFirst"
  Then I press "Log Out"
  Then I press "leftButtonFirst"
  Then I press "Accounts"
  Then I wait for 2 seconds
  Then I go back
  And I see "No accounts"