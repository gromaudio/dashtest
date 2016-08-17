Feature: WebRadio Widget

Scenario: Start
  Then I press "skipButton"
  Then I press "button2"
  Then I press "menu_button"
  Then I press "replace"
  Then I press "PLUGINS"
  Then I press "WebRadio"

Scenario: Navigation through the plugin
  Then I press "icon"
  Then I see "Stations"
  And I see "Favorites"
  And I see "Recents"
  And I see "Records"
  Then I press "Records"
  And I see "Search"
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

Scenario: Play Radio
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I press "Music"
  Then I press list item number 3
  Then I press "Boss Boss Radio (US)"
  Then I wait for progress
  Then I press "slide_panel_now_playing_title"
  Then I press "pause"
  Then I see "Boss Boss Radio (US)" 
   
Scenario: Add to favorite (long press)
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I press "Music"
  Then I press list item number 3
  Then I long press list item number 5
  Then I press "Add to favorites"
  Then I press "Favorites"
  And I see "Boss Boss Radio (US)"

Scenario: Delete radio station from favorites (long press)
  Then I press "icon"
  Then I press "Favorites"
  Then I long press "Boss Boss Radio (US)"
  Then I press "Delete from favorites"

Scenario: Add to favorite (favorite button)
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I press "Music"
  Then I press list item number 3
  Then I press list item number 5
  Then I press "slide_panel_now_playing_title"
  Then I press "shuffle"
  Then I press "WebRadio"
  Then I press "Favorites"
  Then I see "Boss Boss Radio (US)"

Scenario: Record audio
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I press "Music"
  Then I press list item number 3
  Then I press list item number 5
  Then I press "slide_panel_now_playing_title"
  Then I press "repeat"
  Then I press "repeat"
  Then I press "WebRadio"
  Then I press "Records"
  Then I see "Boss Boss Radio (US)"

Scenario: Long press navigation
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I press "Music"
  Then I press list item number 3
  Then I long press list item number 5
  And I see "Play"
  And I see "Delete from favorites"
  Then I go back
  Then I press "Favorites"
  Then I long press "Boss Boss Radio (US)"
  And I see "Play"
  And I see "Delete from favorites"
  Then I go back
  Then I press "Records"
  Then I long press "Boss Boss Radio (US)"
  And I see "Play"
  And I see "Delete"

Scenario: Top layout menu
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I press "topContentContainer"
  Then I press "firstButtonLayout"
  And I see "WebRadio"
  And I see "Driving Mode"

Scenario: Exit option
  Then I press "icon"
  Then I press "leftButtonFirst"
  Then I press "Exit"
  Then I see "Where is My Car"
  Then I see "WebRadio"

 