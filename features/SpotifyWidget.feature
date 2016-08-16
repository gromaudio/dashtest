Feature: Spotify

Scenario: Start
  Then I press "skipButton"
  Then I press "button2" 
  Then I press "menu_button"
  Then I press "replace"
  Then I press "PLUGINS"
  Then I press "Spotify"
  Then I wait for 2 seconds

Scenario: Navigation through the widget 
  Then I press "icon"
  Then I wait for 10 seconds
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
  Then I press "leftButtonFirst"
  And I see "Accounts"
  And I see "Settings"
  And I see "About"
  And I see "Exit"

Scenario: Check About section
  Then I press "icon"
  Then I press "leftButtonFirst"
  Then I press "About"
  And I see "Spotify plugin for DashLinQ."
  And I see "Copyright GROM Audio 2015"