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
  Then I wait for 4 seconds
  Then I tap on Log in to Spotify
  Then I enter credentials
  Then I wait for 2 seconds
  Then I press enter button
  Then I wait for 10 seconds

#STATIONS TAB

Scenario: Check "Stations" tab 
  Then I press "icon"
  Then I wait for 5 seconds
  Then I go back
  Then I scroll up
  Then I scroll up
  Then I scroll up
  Then I scroll up
  And I see "Blues"
  And I see "Christian music"
  And I see "Classical"
  And I see "Comedy"
  And I see "Country"
  Then I scroll down
  And I see "Club music"
  And I see "Folk"
  And I see "Gospel"
  And I see "Heavy metal"
  Then I scroll down
  And I see "Hip-Hop"
  And I see "Indie"
  And I see "Jazz"
  And I see "Latin"
  And I see "Pop"
  Then I scroll down
  And I see "Punk"
  And I see "Rhythm & Blues" 
  And I see "Reggae"
  And I see "Rock"
  And I see "Soul"
  Then I scroll up
  Then I scroll up
  Then I scroll up
  Then I scroll up

#CHARTS TAB

Scenario: Check "Charts" tab 
  Then I press "icon"
  Then I wait for 5 seconds
  Then I go back
  Then I press "Charts"
  Then I scroll up
  And I see "Today\'s Top Hits"
  And I see "Rap Caviar"
  And I see "electroNOW"
  And I see "Rock This"
  And I see "Are & Be"
  Then I scroll down
  And I see "Viva Latino"
  And I see "Hot Country"
  And I see "New Music Friday"
  And I see "Viral Hits"
  And I see "Fresh Finds"
  Then I scroll up
  Then I press "Stations"

Scenario: Add to/Save as playlist 
  Then I press "icon"
  Then I wait for 5 seconds
  Then I go back
  Then I press "Charts"
  # Save as playlist
  Then I long press "Rap Caviar"
  Then I press "Save as playlist"
  Then I press "New Releases"
  Then I touch the "Genres" text
  Then I touch the "Your" text
  Then I press "Playlists"
  And I see "Rap Caviar"
  Then I press "actionBackArrow"
  Then I press "Genres and Moods"
  Then I touch the "Releases" text
  Then I press "Charts"
  # Add to playlist
  Then I long press "electroNOW"
  And I press "Add to playlist"
  Then I press "New"
  Then I press "Save"
  Then I press "New Releases"
  Then I touch the "Genres" text
  Then I touch the "Your" text
  Then I press "Playlists"
  And I see "electroNOW"
  Then I long press "electroNOW"
  And I press "Delete"
  Then I long press "Rap Caviar"
  And I press "Delete"
  Then I press "actionBackArrow"
  Then I press "Genres and Moods"
  Then I touch the "Releases" text
  Then I press "Charts"
  Then I press "Stations"

Scenario: Delete from playlist  
  Then I press "icon"
  Then I wait for 5 seconds
  Then I go back
  Then I press "Charts"
  Then I long press "Rap Caviar"
  Then I press "Save as playlist"
  Then I press "New Releases"
  Then I touch the "Genres" text
  Then I touch the "Your" text
  Then I press "Playlists"
  And I see "Rap Caviar"
  Then I long press "Rap Caviar"
  And I press "Delete"
  Then I don't see "Rap Caviar"
  Then I press "actionBackArrow"
  Then I press "Genres and Moods"
  Then I touch the "Releases" text
  Then I press "Charts"
  Then I press "Stations"

#GENRES AND MOODS TAB 

Scenario: Check "Genres and Moods" tab 
  Then I press "icon"
  Then I wait for 5 seconds
  Then I go back
  Then I press "Charts"
  Then I press "New Releases"
  Then I press "Genres and Moods"
  And I see "Mood"
  And I see "Party"
  And I see "Pop"
  And I see "Trending"

  Then I scroll down
  And I see "Focus"
  And I see "Rock"
  And I see "Indie"
  And I see "EDM/Dance"

  Then I scroll down
  And I see "Chill"
  And I see "Dinner"
  And I see "Sleep"
  And I see "Hip Hop"

  Then I scroll down
  And I see "Workout"
  And I see "RnB"
  And I see "Country"
  And I see "Folk &"

  Then I scroll down
  And I see "Metal"
  And I see "Soul"
  And I see "Travel"
  And I see "Decades"

  Then I scroll down
  And I see "Jazz"
  And I see "Blues"
  And I see "Reggae"
  And I see "Latino"

  Then I scroll down
  And I see "Punk"
  And I see "Romance"
  And I see "Funk"
  And I see "Classical"

  Then I scroll down
  And I see "Comedy"
  And I see "Kids"
  And I see "Gaming"

  Then I scroll up
  Then I scroll up
  Then I scroll up
  Then I scroll up
  Then I scroll up
  Then I scroll up
  Then I scroll up

  Then I press "New Releases"
  Then I press "Charts"
  Then I press "Stations"
@debug
Scenario: Add to/Save as playlist 
  Then I press "icon"
  Then I wait for 5 seconds
  Then I go back
  Then I press "Charts"
  Then I press "New Releases"
  Then I touch the "Genres" text
  Then I press "Mood"
  Then I long press "Happy Hits!"
  Then I press "Save as playlist"
  Then I long press "Brain Food"
  And I press "Add to playlist"
  Then I press "New"
  Then I press "Save"
  Then I press "actionBackArrow"
  Then I touch the "Your" text
  Then I press "Playlists"
  And I see "Brain Food"
  And I see "Happy Hits!"
  Then I long press "Brain Food"
  And I press "Delete"
  Then I long press "Happy Hits!"
  And I press "Delete"
  Then I press "actionBackArrow"
  Then I press "Genres and Moods"
  Then I touch the "Releases" text
  Then I press "Charts"
  Then I press "Stations"
@debug
Scenario: Delete from playlist  
  Then I press "icon"
  Then I wait for 5 seconds
  Then I go back
  Then I press "Charts"
  Then I press "New Releases"
  Then I touch the "Genres" text
  Then I press "Party"
  Then I long press "TGIF"
  And I press "Add to playlist"
  Then I press "New"
  Then I press "Save"
  Then I press "actionBackArrow"
  Then I touch the "Your" text
  Then I press "Playlists"
  Then I long press "TGIF"
  And I press "Delete"
  Then I don't see "TGIF"
  Then I press "actionBackArrow"
  Then I press "Genres and Moods"
  Then I touch the "Releases" text
  Then I press "Charts"
  Then I press "Stations"

#YOUR MUSIC TAB

Scenario: Check "Your Music" tab 
  Then I press "icon"
  Then I wait for 4 seconds
  Then I go back
  Then I press "New Releases"
  Then I press "Genres and Moods"
  Then I press "Your Music"
  And I see "Songs"
  And I see "Playlists"
  And I see "Albums"
  And I see "Artists"
  And I see "Recently played"

  Then I press "Genres and Moods"
  Then I touch the "Releases" text
  Then I press "Charts"
  Then I press "Stations"
  

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
  Then I press "Genres and Moods"
  Then I touch the "Releases" text
  Then I press "Charts"
  Then I press "Stations"
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
  #Then I see "Library Side Swipe"
  #And I see "Enable side swipe for faster library navigation"
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