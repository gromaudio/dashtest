Feature: WebRadio Plugin

@debug
Scenario: Start
  Then I press "skipButton"
  Then I press "button2"
  Then I press "menu_button"
  Then I press "replace"
  Then I press "PLUGINS"
  Then I press "WebRadio"

Scenario: Navigation through the tabs
  Then I press "icon"
  # Ensure there is a default station selected in the player
  And I see "Megapolis FM 89.5"
  # Stations tab
  Then I see "Stations"
  And I see "Local radio"
  And I see "Trending"
  And I see "Music"
  And I see "Sports"
  Then I scroll down
  And I see "News"
  And I see "By Location"
  And I see "By Language"
  Then I scroll up
  # Favorites tab
  Then I see "Favorites"
  Then I press "Favorites"
  And I see "No favorite stations found."
  # Recents tab
  Then I see "Recents"
  Then I press "Recents"
  And I see "Megapolis FM 89.5"
  # Records tab
  Then I see "Records"
  Then I press "Records"
  And I see "No radio records found."
  # Search tab
  Then I see "Search"
  Then I press "Search"
  Then I press "search_bar"
# FIXME: ensure we're seeing the right search tab interface 
# Done
# And I see "Search Music" - doesn't work
# Done

Scenario: Settings
  Then I press "icon"
  Then I press "leftButtonFirst"
  And I see "Settings"
  And I see "About"
  And I see "Exit"
  Then I press "About"
  And I see "Web Radio player for DashLinQ. Plays web radio stations, FM online stations and other streaming sources, smart caching, easy recording and voice search."
  And I see "Copyright GROM Audio 2015"
  Then I go back
  Then I press "leftButtonFirst"
  Then I press "Settings"
  Then I see "WebRadio Settings"
  And I see "Gestures"
  And I see "AutoHide Panels"
  And I see "Library Side Swipe"

Scenario: Traversing down/up by Stations tab hierarchy
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I press "Sports"
  And I see "More Sports and Teams"
  And I see "Fantasy Sports"
  And I see "Sports Talk & News"
  Then I press "More Sports and Teams"
  And I see "Explore Sports"
  And I see "Events"
  Then I press "Explore Sports"
  And I see "American Football"
  And I see "Baseball"
  And I see "Basketball"
  Then I press " .. "
  And I see "Explore Sports"
  And I see "Events"
  Then I press " .. "
  And I see "More Sports and Teams"
  And I see "Fantasy Sports"
  And I see "Sports Talk & News"
  Then I press " .. "
  And I see "Local radio"
  And I see "Trending"
  And I see "Music"
  And I see "Sports"
# FIXME: We need a scenario to check traversing down/up by Stations tab hierarchy: Music/60's/../../ 
# Done

# FAVORITES TAB
Scenario: Add to favorite (long press)
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I press "Music"
  Then I press "60\'s"
  Then I get text for item number 5
  Then I long press list item number 5
  Then I press "Add to favorites"
  Then I press "Favorites"
  Then I see item number text

Scenario: Delete radio station from favorites (long press)
  Then I press "icon"
  Then I press "Favorites"
  Then I long press list item number 1
  Then I press "Delete from favorites"
  And I see "No favorite stations found."
# FIXME: Ensure track disappeared from favorites list and there is a text "No favorite stations found."
# Done

Scenario: Add to favorite (favorite button)
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I press "Music"
  Then I press "60\'s"
  Then I press list item number 5
  Then I get text for item number 5
  Then I press "slide_panel_now_playing_title"
  Then I press "shuffle"
  Then I press "WebRadio"
  Then I press "Favorites"
  Then I see item number text

Scenario: Delete from favorite (favorite button)
  Then I press "icon"
  Then I press "Favorites"
  Then I press list item number 1
  Then I press "slide_panel_now_playing_title"
  Then I press "shuffle"
  Then I press "WebRadio"
  And I see "No favorite stations found."
# FIXME: Ensure that removing from favorites by favorite button is working too
# Done

# FIXME: Ensure that Favorite button (Star) is changing its color (white/cyan) depending on whether station in favorites or not (investigate - need custom steps for highlighted element)

Scenario: Play favorite station
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I press "Music"
  Then I press "60\'s"
  Then I long press list item number 5
  Then I press "Add to favorites"
  Then I press "Favorites"
  Then I press list item number 1
  Then I press "slide_panel_now_playing_title"
  Then I check Radio playing
  Then I press "shuffle"
# FIXME: We need a scenario to check if starting station from Favorites tab is working      
# Done

Scenario: Play favorite station (Long press)
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I press "Music"
  Then I press "60\'s"
  Then I long press list item number 5
  Then I press "Add to favorites"
  Then I press "Favorites"
  Then I long press list item number 1
  Then I press "Play"
  Then I press "slide_panel_now_playing_title"
  Then I check Radio playing
# FIXME: Ensure that Play option from long press menu is working too
# Done
@debug
Scenario: Switching between stations
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I press "Music"
  Then I press "70\'s"
  Then I wait for 2 seconds
  Then I long press list item number 5
  Then I press "Add to favorites"
  Then I press " .. "
  Then I press " .. "
  Then I press "Trending"
  Then I long press list item number 4
  Then I press "Add to favorites"
  Then I press "Favorites"
  Then I press list item number 1
  Then I press "slide_panel_now_playing_title"
  And I see "1/3"
  Then I press "next_control"
  And I see "2/3"
  Then I press "next_control"
  And I see "3/3"
  Then I press "prev_control"
  And I see "2/3"
  Then I press "prev_control"
  And I see "1/3"
# FIXME: We need a scenario when there are few favorite stations and switching between them is working
# Done

# FIXME: Ensure that tap on the cover opens "Favorites" playlist and there is currently playing radio in the list (investigate - need custom steps for highlighted element)
# FIXME: Ensure that currently playing station is highlighted in the list same way as in Stations tab (investigate - need custom steps for highlighted element)

Scenario: Long press navigation
  Then I press "icon"
  Then I press "Favorites"
  Then I long press list item number 1
  And I see "Play"
  And I see "Delete from favorites"
  
# RECENTS TAB
@debug
Scenario: Recents tab
  # start some stations from Stations tab appears in the Recents tab at the top of the list
  # Play
  Then I press "icon"
  Then I press "Favorites"
  Then I get text for item number 1
  Then I wait for 5 seconds
  Then I press list item number 1
  Then I press "Recents"
  Then I press list item number 1
  Then I press "slide_panel_now_playing_title"
  Then I check Radio playing
  Then I see item number text
  And I see "1/4"
  Then I press "next_control"
  Then I press "pause"
  Then I press "WebRadio"
  # Long press Play
  Then I long press list item number 1
  Then I press "Play"
  Then I press "slide_panel_now_playing_title"
  Then I check Radio playing
  # Switching between stations
  And I see "1/4"
  Then I press "next_control"
  And I see "2/4"
  Then I press "next_control"
  And I see "3/4"
  Then I press "next_control"
  And I see "4/4"
  Then I press "prev_control"
  And I see "3/4"
  Then I press "prev_control"
  And I see "2/4"
  Then I press "WebRadio"
  # "Add to favorites"/"Remove from favorites" options from long press menu in Recents tab
  Then I long press "Megapolis FM 89.5"
  Then I press "Add to favorites"
  Then I press "Favorites"
  And I see "Megapolis FM 89.5"
  Then I press "Recents"
  Then I long press "Megapolis FM 89.5"
  Then I press "Delete from favorites"
  Then I long press "Megapolis FM 89.5"
  And I see "Add to favorites"
  Then I go back
  Then I press "Favorites"
  And I don't see "Megapolis FM 89.5" 
# FIXME: We need a scenario when we start some stations from Stations tab and this station appears in the Recents tab at the top of the list
# Done
# FIXME: We need a scenario to check if starting station from Recents tab is working
# Done
# FIXME: Ensure that Play option from long press menu in Recents tab is working too
# Done
# FIXME: We need a scenario to check if switching between stations in Recents tab is working
# Done
# FIXME: Ensure that "Add to favorites"/"Remove from favorites" options from long press menu in Recents tab are working
# Done

# FIXME: Ensure that currently playing station is highlighted in the list same way as in Stations tab (investigate - need custom steps for highlighted element)
# FIXME: Ensure that tap on the cover opens "Recents" playlist and there is currently playing radio in the list (investigate - need custom steps for highlighted element)

Scenario: Long press navigation
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Recents"
  Then I long press "Megapolis FM 89.5"
  And I see "Play"
  And I see "Add to favorites"
  Then I press "Add to favorites"
  Then I long press list item number 5
  And I see "Play"
  And I see "Delete from favorites"
  Then I press "Delete from favorites"
  
# RECORDS TAB
Scenario: Record audio
  Then I press "icon"
  Then I press "Recents"
  Then I press "Megapolis FM 89.5"
  Then I press "slide_panel_now_playing_title"
  Then I press "repeat"
  Then I wait for 3 seconds
  Then I press "repeat"
  Then I press "WebRadio"
  Then I press "Records"
  Then I see "Megapolis FM 89.5"
  # Starting station from Records tab
  Then I press list item number 1
  Then I press "slide_panel_now_playing_title"
  Then I check Radio playing
  Then I press "WebRadio"
  Then I press "Recents"
  # Starting station from Records tab (Long press)
  Then I press list item number 1
  Then I press "Records"
  Then I long press list item number 1
  Then I press "Play"
  Then I press "slide_panel_now_playing_title"
  Then I check Radio playing

Scenario: Long press navigation
  Then I press "icon"
  Then I press "Recents"
  Then I press "Records"
  Then I long press list item number 1
  And I see "Play"
  And I see "Delete"
  
Scenario: Delete from Records
  Then I press "icon"
  Then I press "Recents"
  Then I press "Records"
  # Currently playing record is unable to delete
  Then I press "Megapolis FM 89.5"
  Then I long press list item number 1
  Then I press "Delete"
  And I see "Megapolis FM 89.5"
  # Delete record
  Then I press "Recents"
  Then I press list item number 1
  Then I press "Records"
  Then I long press list item number 1
  Then I press "Delete"
  Then I see "No radio records found."

# FIXME: We need a scenario to check if starting station from Records tab is working
# Done
# FIXME: Ensure that Play option from long press menu in Records tab is working too
# Done
# FIXME: We need a scenario to check if Delete option from long press menu in Records tab is working. Currently playing track is unable to delete
# Done

# FIXME: Ensure that tap on the cover opens "Records" playlist and there is currently playing record in the list (investigate - need custom steps for highlighted element)
# FIXME: Ensure that Record button is highlighted while recording (investigate - need custom steps for highlighted element)
 
# STATIONS TAB
Scenario: Play Radio
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I press "Music"
  Then I press "60\'s"
  # Play station
  Then I press list item number 5
  Then I press "slide_panel_now_playing_title"
  Then I wait for 2 seconds
  Then I check Radio playing
  Then I press "pause"
  Then I press "next_control"
  Then I press "WebRadio"
  # Play station (long press)
  Then I long press list item number 5
  Then I press "Play"
  Then I press "slide_panel_now_playing_title"
  Then I check Radio playing
  # Pause
  Then I press "pause"
  Then I check Radio pause
  # Play again
  Then I press "pause"
  Then I check Radio playing

Scenario: Stations switching by next/prev 
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I press "Music"
  Then I press "60\'s"
  Then I press list item number 5
  Then I press "slide_panel_now_playing_title" 
  Then I should see text containing "1/"
  Then I press "next_control"
  And I should see text containing "2/"
  Then I press "next_control"
  And I should see text containing "3/"
  Then I press "prev_control"
  And I should see text containing "2/"
  Then I press "pause"
  Then I press "WebRadio"
# FIXME: Ensure stations switching is working by next/prev buttons and cover right/left slides by checking current track number:
# Then I see "1/21"
# When I press "Next"
# Then I see "2/21"  
# Done

Scenario: Long press navigation
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I press "Music"
  Then I press "80\'s"
  Then I long press list item number 5
  And I see "Play"
  And I see "Add to favorites"
  Then I press "Add to favorites"
  Then I long press list item number 5
  And I see "Play"
  And I see "Delete from favorites"
  Then I press "Delete from favorites"
  
# FIXME: Ensure that Play option from long press menu is working too 
# Done
# FIXME: ensure that playback actually paused by checking current position is not counting or something like that
# Done
# FIXME: press play once again and ensure playback resumed
# Done
  


# FIXME: Ensure that tap on the cover opens "On The Go" playlist and there is "Boss Boss Radio" in the list  
# FIXME: Ensure that double tap on the cover opens track info dialog with File name, Size, Format fields etc.

# FIXME: ensure track is highlighted in the list (text color is cyan and V icon exists) (investigate - need custom steps for highlighted element)
# FIXME: also we should go back to upper levels and ensure that Music/60s folders are highlighted too (investigate - need custom steps for highlighted element)

# TOP LAYOUT MENU
Scenario: Top layout menu (Home icon)
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I press "topContentContainer"
  Then I press "firstButtonLayout"
  And I see "WebRadio"
  And I see "Driving Mode"

Scenario: Top layout menu (Voice commands icon)
  Then I press "icon"
  Then I press "topContentContainer"
  Then I press "thirdButtonLayout"
  And I see "Call"
  And I see "Navigate" 

Scenario: Exit option
  Then I press "icon"
  Then I press "leftButtonFirst"
  Then I press "Exit"
  Then I see "Where is My Car"
  Then I see "WebRadio"

# AM/FM Radio
Scenario: Start
  Then I press "menu_button"
  Then I press "replace"
  Then I press "SHORTCUTS"
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
  Then I press "SHORTCUTS"
  Then I scroll until I see the "FM Radio" text
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






# FIXME: Divide and move this scenario to scenarios when checking appropriate tabs
# Done

# FIXME: We need a scenario to check Search tab  
