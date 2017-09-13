Feature: WebRadio Plugin

Scenario: Start
  Then I press "closeButton"
  Then I press "button2"
  Then I press "menu_button"
  Then I press "replace"
  Then I press "PLUGINS"
  Then I press "WebRadio"

Scenario: Settings
  Then I press "icon"
  Then I press "leftButtonFirst"
  And I see "Settings"
  And I see "About"
  And I see "Home"
  Then I press "About"
  And I see "Web Radio player for DashLinQ. Plays web radio stations, FM online stations and other streaming sources, smart caching, easy recording and voice search."
  And I see "Copyright GROM Audio 2015"
  Then I go back
  Then I press "leftButtonFirst"
  Then I press "Settings"
  Then I see "WebRadio Settings"
  And I see "Gestures"
  And I see "AutoHide Panels"
  Then I press "AutoHide Panels"

Scenario: Navigation through the tabs
  Then I press "icon"
  Then I wait for 8 seconds
  # Ensure there is a default station selected in the player
  And I see "Megapolis FM 89.5"
  # Stations tab
  Then I see "Stations"
  And I see "Local radio"
  And I see "Trending"
  And I see "Music"
  Then I scroll to "Sports" text
  And I see "Sports"
  Then I scroll to "News" text
  And I see "News"
  Then I scroll to "By Location" text
  And I see "By Location"
  Then I scroll to "By Language" text
  And I see "By Language"
  Then I drag from 50:30 to 50:300 moving with 20 steps
  # Favorites tab
  Then I see "Favorites"
  Then I press "Favorites"
  And I see "There are no items found in Favorites."
  # Recents tab
  Then I see "Recents"
  Then I press "Recents"
  And I see "Megapolis FM 89.5"
  # Records tab
  Then I see "Records"
  Then I press "Records"
  Then I see "There are no items found in Records."
  # Search tab
  Then I see "Search"
  Then I press "Search"
  Then I press "search_bar"
  Then I go back
  Then I press "Records"
  Then I press "Recents"
  Then I press "Favorites"
  Then I press "Stations"

Scenario: Traversing down/up by Stations tab hierarchy
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I scroll to "Sports" text
  Then I press "Sports"
  Then I wait for 4 seconds
  And I see "More Sports and Teams"
  And I see "Fantasy Sports"
  Then I scroll to "Sports Talk & News" text
  And I see "Sports Talk & News"
  Then I drag from 50:30 to 50:300 moving with 20 steps
  Then I press "More Sports and Teams"
  And I see "Explore Sports"
  And I see "Events"
  Then I press "Explore Sports"
  And I see "Baseball"
  Then I scroll to "Basketball" text
  And I see "Basketball"
  Then I drag from 50:30 to 50:300 moving with 20 steps
  Then I press " .. "
  And I see "Explore Sports"
  And I see "Events"
  Then I press " .. "
  And I see "More Sports and Teams"
  And I see "Fantasy Sports"
  Then I press " .. "
  Then I drag from 50:30 to 50:300 moving with 20 steps
  And I see "Local radio"
  And I see "Trending"
  And I see "Music"
  
# FAVORITES TAB

Scenario: Add/remove favorite (long press)
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I press "Trending"
  Then I wait for 10 seconds
  Then I get text for item number 3
  Then I long press image view number 3
  Then I press "Add to favorites"
  Then I scroll up
  Then I press " .. "
  Then I press "Favorites"
  Then I see item number text
  Then I long press previously added element
  Then I press "Delete from favorites"
  And I see "There are no items found in Favorites."

Scenario: Add/remove favorite (favorite button)
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I press "Trending"
  Then I wait for 10 seconds
  Then I get text for item number 3
  Then I press image view number 3
  Then I press "slide_panel_now_playing_title"
   
  Then I long touch left_button
  Then I touch icon number 3
  Then I touch left_button

  Then I press "actionBackArrow"
  Then I scroll up
  Then I press " .. "
  Then I press "Favorites"
  Then I see item number text
  Then I press previously added element
  Then I press "slide_panel_now_playing_title"
  Then I press "shuffle"
  Then I press "actionBackArrow"
  And I see "There are no items found in Favorites."

Scenario: Play favorite station
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I press "Trending"
  Then I wait for 10 seconds
  Then I long press list item number 3
  Then I press "Add to favorites"
  Then I press " .. "
  Then I press "Favorites"
  Then I press list item number 1
  Then I press "slide_panel_now_playing_title"
  Then I wait for start
  Then I check Radio playing
  Then I press "pause"
  Then I check Radio pause
  Then I press "shuffle"

Scenario: Play favorite station (Long press)
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I press "Trending"
  Then I wait for 10 seconds
  Then I long press list item number 6
  Then I press "Add to favorites"
  Then I press " .. "
  Then I press "Favorites"
  Then I long press list item number 1
  Then I press "Play"
  Then I press "slide_panel_now_playing_title"
  Then I wait for start
  Then I check Radio playing
  Then I press "pause"
  Then I check Radio pause
  Then I press "shuffle"

Scenario: Switching between favorite stations
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I press "Trending"
  Then I wait for 10 seconds
  Then I get text for item number 3
  Then I long press list item number 3
  Then I press "Add to favorites"
  Then I press "Favorites"
  Then I see item number text
  Then I press "Stations"
  Then I wait for 6 seconds
  Then I get text for item number 6
  Then I long press list item number 6
  Then I press "Add to favorites"
  Then I press "Favorites"
  Then I see item number text
  Then I press "Stations"
  Then I press " .. "
  Then I press "Favorites"
  Then I see item number text
  Then I get text for item number 1
  Then I press list item number 1
  Then I press "slide_panel_now_playing_title"
  Then I see item number text
  And I see "1/2"
  Then I press "actionBackArrow"
  Then I get text for item number 4
  Then I press "slide_panel_now_playing_title"
  Then I press "next_control"
  Then I see item number text
  And I see "2/2"
  Then I press "actionBackArrow"
  Then I get text for item number 1
  Then I press "slide_panel_now_playing_title"
  Then I press "prev_control"
  Then I see item number text
  And I see "1/2"
  # swipe switching
  Then I press "actionBackArrow"
  Then I get text for item number 1
  Then I press "slide_panel_now_playing_title"
  Then I swipe to left
  Then I see item number text
  And I see "1/2"
  Then I press "actionBackArrow"
  Then I get text for item number 4
  Then I press "slide_panel_now_playing_title"
  Then I swipe to right
  Then I see item number text
  And I see "2/2"
  # Tap on cover
  Then I tap on cover
  And I see "Favorites"
  Then I go back
  Then I wait for 2 seconds
  Then I go back
  Then I press "Stations"
  Then I press "Local radio"
  Then I press list item number 3
  Then I press " .. "
  Then I press "Favorites"
  Then I long press list item number 1
  Then I press "Delete from favorites"
  Then I wait for 5 seconds
  Then I long press list item number 1
  Then I press "Delete from favorites"
  Then I wait for 3 seconds
  And I see "There are no items found in Favorites."

# RECENTS TAB

Scenario: Recents tab
  # Play
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I press "Trending"
  Then I wait for 8 seconds
  Then I get text for item number 3
  Then I press list item number 3
  Then I press " .. "

  Then I press "Local radio"
  Then I wait for 6 seconds
  Then I press list item number 3

  Then I press "Recents"
  Then I see item number text
  Then I press previously added element
  Then I press "slide_panel_now_playing_title"
  Then I see item number text
  Then I wait for start
  And I see "1/"
  Then I check Radio playing 
  Then I press "pause"
  Then I press "actionBackArrow"
  Then I press "Favorites"
  Then I press "Stations"
  Then I wait for 4 seconds
  Then I get text for item number 6
  Then I press list item number 6
  Then I press "Recents"
  Then I see item number text
  Then I press previously added element
  Then I press "slide_panel_now_playing_title"
  Then I see item number text
  And I see "1/"
  Then I press "pause"
  Then I press "actionBackArrow"

  # Long press Play
  Then I get text for item number 4
  Then I long press list item number 4
  Then I press "Play"
  Then I press "slide_panel_now_playing_title"
  Then I wait for start
  Then I check Radio playing
  Then I press "pause"
  Then I check Radio pause
  Then I press "pause"

  # Switching between stations
  Then I see item number text
  And I see "2/"
  Then I press "actionBackArrow"
  Then I get text for item number 7
  Then I press "slide_panel_now_playing_title"
  Then I press "next_control"
  Then I see item number text
  And I see "3/"
  Then I press "actionBackArrow"
  Then I get text for item number 4
  Then I press "slide_panel_now_playing_title"
  Then I press "prev_control"
  Then I see item number text
  And I see "2/"

  # Swipe switching
  Then I press "actionBackArrow"
  Then I get text for item number 1
  Then I press "slide_panel_now_playing_title"
  Then I swipe to left
  Then I see item number text
  And I see "1/"
  Then I press "actionBackArrow"
  Then I get text for item number 4
  Then I press "slide_panel_now_playing_title"
  Then I swipe to right
  Then I see item number text
  And I see "2/"
  Then I press "pause"
  
  # Tap on cover
  Then I tap on cover
  And I see "Recents"
  Then I go back
  Then I wait for 2 seconds
  Then I go back
  
  # Add to favorites/Remove from favorites options from long press menu in Recents tab
  Then I get text for item number 1
  Then I long press list item number 1
  Then I press "Add to favorites"
  Then I press "Favorites"
  Then I see item number text
  Then I press "Recents"
  Then I long press list item number 1
  Then I press "Delete from favorites"
  Then I long press list item number 1
  And I see "Add to favorites"
  Then I go back
  Then I press "Favorites"
  And I see "There are no items found in Favorites."

# RECORDS TAB

Scenario: Record audio
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I press " .. "
  Then I press "Trending"
  Then I wait for 10 seconds
  Then I get text for item number 3
  Then I press list item number 3
  Then I press "slide_panel_now_playing_title"
  Then I wait for start
  Then I long touch left_button
  Then I touch icon number 2
  Then I press "shuffle"
  Then I wait for 10 seconds
  Then I press "shuffle"
  Then I go back
  Then I press "Recents"
  Then I press "Records" 
  Then I see item number text
  Then I press "Favorites"
  Then I press "Stations"
  Then I wait for 2 seconds
  Then I get text for item number 6
  Then I press list item number 6
  Then I press "slide_panel_now_playing_title"
  Then I wait for start
  Then I press "shuffle"
  Then I wait for 10 seconds
  Then I press "shuffle"
  Then I go back
  Then I press "Recents"
  Then I press "Records"
  Then I see item number text

  # Starting station from Records tab
  Then I press list item number 1
  Then I press "slide_panel_now_playing_title"
  Then I wait for start
  Then I check Radio playing
  Then I press "pause"
  Then I check Radio pause
  Then I press "pause"
  Then I go back

  # Starting station from Records tab (Long press)
  Then I long press list item number 4
  Then I press "Play"
  Then I press "slide_panel_now_playing_title"
  Then I wait for start
  Then I check Radio playing
  Then I press "pause"
  Then I check Radio pause
  Then I go back
  Then I press "Favorites"
  Then I press "Stations"
  
Scenario: Switching between records
  Then I press "icon"
  Then I press "Recents"
  Then I press "Records"
  Then I wait for 2 seconds
  Then I get text for item number 1
  Then I press list item number 1
  Then I press "slide_panel_now_playing_title"
  Then I see item number text
  And I see "1/2"
  Then I press "actionBackArrow"
  Then I get text for item number 4
  Then I press "slide_panel_now_playing_title"
  Then I press "next_control"
  Then I see item number text
  And I see "2/2"
  Then I press "actionBackArrow"
  Then I get text for item number 1
  Then I press "slide_panel_now_playing_title"
  Then I press "prev_control"
  Then I see item number text
  And I see "1/2"
  Then I press "actionBackArrow"
  Then I get text for item number 4
  Then I press "slide_panel_now_playing_title"
  Then I swipe to right
  Then I see item number text
  And I see "2/2"
  Then I press "actionBackArrow"
  Then I get text for item number 1
  Then I press "slide_panel_now_playing_title"
  Then I swipe to left
  Then I see item number text
  And I see "1/2"
  Then I press "actionBackArrow"
  Then I long press list item number 4
  And I press "Delete"

Scenario: Tap on cover
  Then I press "icon"
  Then I press "Recents"
  Then I press "Records"
  Then I press list item number 1
  Then I press "slide_panel_now_playing_title"
  Then I tap on cover
  And I see "Records"
  Then I press "actionBackArrow"
  Then I wait for 1 second
  Then I press "pause"
  Then I press "actionBackArrow"

Scenario: Delete from Records
  Then I press "icon"
  Then I press "Recents"
  Then I press "Records"
  Then I wait for 2 seconds
  # Currently playing record is unable to delete
  Then I press list item number 1
  Then I wait for 1 second
  Then I long press list item number 1
  Then I press "Delete"
  Then I see "Unable to delete playing track"
  # Delete record
  Then I press "Recents"
  Then I press list item number 1
  Then I press "Records"
  Then I wait for 1 second
  Then I long press list item number 1
  Then I press "Delete"
  Then I see "There are no items found in Records."
 
# STATIONS TAB
Scenario: Play Radio
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I press " .. "
  Then I press "Music"
  Then I wait for 3 seconds
  Then I press "60\'s"
  Then I wait for 5 seconds
  # Play station
  Then I press list item number 5
  Then I press "slide_panel_now_playing_title"
  Then I wait for start
  Then I check Radio playing
  Then I press "pause"
  Then I check Radio pause
  Then I press "next_control"
  Then I press "actionBackArrow"
  # Play station (long press)
  Then I long press list item number 5
  Then I press "Play"
  Then I press "slide_panel_now_playing_title"
  Then I wait for start
  Then I check Radio playing
  # Pause
  Then I press "pause"
  Then I check Radio pause
  # Play again
  Then I press "pause"
  Then I wait for start
  Then I check Radio playing
  Then I press "pause"

Scenario: Stations switching by next/prev 
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I press " .. "
  Then I press " .. "
  Then I press "Trending"
  Then I wait for 10 seconds
  Then I get text for item number 3
  Then I press list item number 3
  Then I press "slide_panel_now_playing_title"
  Then I see item number text
  Then I see "1/"

  Then I press "actionBackArrow"
  Then I get text for item number 6
  Then I press "slide_panel_now_playing_title"
  Then I press "next_control"
  Then I see item number text
  And I see "2/"

  Then I press "actionBackArrow"
  Then I get text for item number 3
  Then I press "slide_panel_now_playing_title"
  Then I press "prev_control"
  Then I see item number text
  And I see "1/"

  # Swipe switching
  Then I press "actionBackArrow"
  Then I get text for item number 6
  Then I press "slide_panel_now_playing_title"
  Then I swipe to right
  Then I see item number text
  Then I see "2/"

  Then I press "actionBackArrow"
  Then I get text for item number 3
  Then I press "slide_panel_now_playing_title"
  Then I swipe to left
  Then I see item number text
  Then I see "1/"

  Then I press "pause"
  Then I press "WebRadio"

Scenario: Tap on cover
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I go back
  Then I press "Trending"
  Then I wait for 10 seconds
  Then I get text for item number 3
  Then I press list item number 3
  Then I press "slide_panel_now_playing_title"
  Then I tap on cover
  Then I wait for 2 seconds
  Then I see item number text
  And I see "Trending"
  Then I press "actionBackArrow"
  Then I wait for 1 second
  Then I press "actionBackArrow"
  Then I press " .. "

Scenario: Long press navigation
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  #Then I press " .. "
  Then I press "Music"
  #Then I scroll to "70\'s" text
  Then I press "70\'s"
  Then I wait for 4 seconds
  Then I long press list item number 5
  And I see "Play"
  And I see "Add to favorites"
  Then I press "Add to favorites"
  Then I long press list item number 5
  And I see "Play"
  And I see "Delete from favorites"
  Then I press "Delete from favorites"
  
Scenario: Exit option
  Then I press "icon"
  Then I press "leftButtonFirst"
  Then I press "Home"
  Then I see "Where is My Car"
  Then I see "WebRadio"

Scenario: Equalizer
  Then I press "icon"
  Then I wait for 2 seconds
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
  Then I press "Recents"
  Then I press "Records"
  Then I press "Search" 
  Then I press "search_bar"
  Then I enter text "KQED-"
  Then I wait for 10 seconds
  Then I see "KQED-FM"
  Then I press "text1"
  Then I wait for 2 seconds
  And I see "KQED-FM"
  Then I press "Recents"
  Then I press "Favorites"
  Then I press "Stations"

Scenario: Add to Favorites from Search tab
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Recents"
  Then I press "Records"
  Then I press "Search" 
  Then I press "search_bar"
  Then I enter text "OMG"
  Then I wait for 5 seconds
  Then I see "OMG K Pop"
  Then I press "OMG K Pop"
  Then I wait for 2 seconds
  Then I long press "1/1 --:--"
  Then I wait for 1 second
  Then I press "Add to favorites"
  Then I press "Records"
  Then I press "Recents"
  Then I press "Favorites"
  And I see "OMG K Pop"
  Then I long press "OMG K Pop"
  Then I wait for 2 seconds
  Then I press "Delete from favorites"
  Then I press "Stations" 

#Scenario: Check buffering station
#  Then I press "icon"
#  Then I press "Stations"
#  Then I press "Music"
#  Then I press "80\'s"
#  Then I press list item number 6
#  Then I press "slide_panel_now_playing_title"
#  Then I wait for start
#  Then I check Radio playing
#  Then I press "pause"
#  Then I go back
#  Then I full scroll down
#  Then I wait for 2 seconds
#  Then I full scroll down
#  Then I tap on cover
#  Then I press "slide_panel_now_playing_title"
#  Then I wait for start
#  Then I check Radio playing
#  Then I press "pause"
#  Then I go back


# AM/FM Radio

Scenario: Start
  Then I press "menu_button"
  Then I press "replace"
  Then I press "PLUGINS"
  Then I press "AM Radio"

Scenario: AM Shortcut
  Then I press "icon"
  Then I see "Stations"
  And I see "Favorites"
  And I see "Records"
  Then I press "slide_panel_now_playing_title"
  And I see "AM Radio"
  Then I go back
  When I press "leftButtonFirst"
  Then I press "Settings"
  And I see "AM Settings"

Scenario: Start
  Then I press "menu_button"
  Then I press "replace"
  Then I press "PLUGINS"
  #Then I scroll until I see the "FM Radio" text
  Then I press "FM Radio"

Scenario: FM Shortcut
  Then I press "icon"
  Then I see "Stations"
  And I see "Favorites"
  And I see "Records"
  Then I press "slide_panel_now_playing_title"
  And I see "FM Radio"
  Then I go back
  When I press "leftButtonFirst"
  Then I press "Settings"
  And I see "FM Settings"

# FIXME (high): Ensure that double tap on the cover opens track info dialog with File name, Size, Format fields etc.
# FIXME: ensure track is highlighted in the list (text color is cyan and V icon exists) (investigate - need custom steps for highlighted element)
# FIXME: also we should go back to upper levels and ensure that Music/60s folders are highlighted too (investigate - need custom steps for highlighted element)