 Feature: Widget tabs

  Scenario: Choose app tabs
    Then I press "skipButton"
    Then I press "button2"
    Then I swipe right
    Then I press "icon"
    Then I see "APPS"
    Then I see "SHORTCUTS"
    Then I see "PLUGINS"
    Then I press "SHORTCUTS"
    Then I press "PLUGINS"
    Then I see "GMusic"
    Then I see "Local Music"
    Then I see "Spotify"
    Then I see "WebRadio"
    Then I see "Where is My Car"