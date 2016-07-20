Feature: WebRadio

Scenario: Navigation through the widget
  Then I press "skipButton"
  Then I press "button2"
  Then I swipe right
  Then I press "icon"
  Then I press "PLUGINS"
  Then I press "WebRadio"
  Then I swipe right
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
  And I see "Gestures"
  And I see "AutoHide Panels"
  And I see "Library Side Swipe"

Scenario: Play Radio
  Then I swipe right
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I press "Local radio"
  Then I press "Kiss FM Ukraine 104.3 (Electronic)"
  Then I wait for progress
  Then I press "slide_panel_now_playing_title"
  Then I press "next_control"
  Then I see "MFM 104.3 (Electronic)"
  Then I press "prev_control"
  Then I press "pause"
  Then I see "Kiss FM Ukraine 104.3 (Electronic)" 

Scenario: Add to favorite (long press)
  Then I swipe right
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I press "Local radio"
  Then I long press "MFM 104.3 (Electronic)"
  Then I press "Add to favorites"
  Then I press "Favorites"
  And I see "MFM 104.3 (Electronic)"
  Then I press "Stations"

Scenario: Delete radio station from favorites
  Then I swipe right
  Then I press "icon"
  Then I press "Favorites"
  Then I long press "MFM 104.3 (Electronic)"
  Then I press "Delete from favorites"

Scenario: Add to favorite (favorite button)
  Then I swipe right
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I press "Local radio"
  Then I press "MFM 104.3 (Electronic)"
  Then I press "slide_panel_now_playing_title"
  Then I press "shuffle"
  Then I go back
  Then I press "Favorites"
  Then I see "MFM 104.3 (Electronic)"

Scenario: Record audio
  Then I swipe right
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I press "Local radio"
  Then I press "MFM 104.3 (Electronic)"
  Then I press "slide_panel_now_playing_title"
  Then I press "repeat"
  Then I press "repeat"
  Then I press "WebRadio"
  Then I press "Records"
  Then I see "MFM 104.3 (Electronic)"

Scenario: Long press navigation
  Then I swipe right
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I press "Local radio"
  Then I long press "Radio ROKS 89.1 (Rock)"
  And I see "Play"
  And I see "Add to favorites"
  Then I go back
  Then I press "Favorites"
  Then I long press "MFM 104.3 (Electronic)"
  And I see "Play"
  And I see "Delete from favorites"
  Then I go back
  Then I press "Records"
  Then I long press "MFM 104.3 (Electronic)" 
  And I see "Play"
  And I see "Delete"

Scenario: Home button layout
  Then I swipe right
  Then I press "icon"
  Then I press "Favorites"
  Then I press "Stations"
  Then I press "topContentContainer"
  Then I press "firstButtonLayout"
  And I see "Local Music"
  And I see "Where Is My Car"
  And I see "Driving Mode"