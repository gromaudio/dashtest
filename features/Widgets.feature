Feature: Operations with Widgets

Scenario: Delete widget
    Then I press "skipButton"
    Then I press "button2"
    Then I swipe right
    Then I press "icon"
    Then I press "PLUGINS"
    Then I press "Spotify"
    Then I press "menu_button"
    Then I press "delete"

Scenario: Replace widget
    Then I swipe right
    Then I press "icon"
    Then I press "PLUGINS"
    Then I press "Spotify"
    Then I press "menu_button"
    Then I press "replace"
    Then I press "PLUGINS"
    Then I press "GMusic"

Scenario: Add widget WebRadio
    Then I swipe right
    Then I press image view number 9
    Then I press "PLUGINS"
    Then I press "WebRadio"
    
Scenario: Add multiple widgets 
    Then I swipe right
    Then I press image view number 10
    Then I press "PLUGINS"
    Then I press "Local Music"
    Then I press image view number 10
    Then I press "PLUGINS"
    Then I press "Where is My Car"
    Then I take a picture    

Scenario: Add widget GMusic
    Then I swipe right
    Then I swipe right
    Then I press "icon"
    Then I press "PLUGINS"
    Then I press "GMusic"

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