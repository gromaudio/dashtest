Feature: Widgets

  Scenario: Delete widget
    Then I press "skipButton"
    Then I press "button2"
    Then I swipe right
    Then I press "icon"
    Then I touch the "Camera" text
    Then I press "menu_button"
    Then I press "delete"

  Scenario: Coose app tabs
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
    Then I swipe left
    Then I swipe left
    Then I press "leftButtonFirst"

  Scenario: Replace widget
    Then I swipe right
    Then I press "icon"
    Then I touch the "Camera" text
    Then I press "menu_button"
    Then I press "replace"
    Then I touch the "Chrome" text

  Scenario: Add widget Camera
    Then I swipe right
    Then I press image view number 9
    Then I touch the "Camera" text
    Then I press "navigation_drawer_button"
    Then I see "Horodotska Street, 128"

  Scenario: Add widget Chrome
    Then I swipe right
    Then I swipe right
    Then I press "icon"
    Then I touch the "Chrome" text

  Scenario: Voice Command (Call)
    Then I press "voice_search"
    Then I see "Voice Commands"
    Then I see "Call"
    Then I see "Navigate"
    Then I press "Call"

  Scenario: Voice Command (Navigate)
    Then I press "voice_search"
    Then I see "Voice Commands"
    Then I press "Navigate"

  Scenario: Navigation
    Then I press "navi_icon"