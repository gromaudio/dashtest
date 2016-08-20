Feature: Operations with Plugins

Scenario: Delete plugin
    Then I press "skipButton"
    Then I press "button2"
    Then I swipe right
    Then I press "icon"
    Then I press "PLUGINS"
    Then I press "Spotify"
    Then I see "Spotify"
    Then I press "menu_button"
    Then I press "delete"
    Then I don't see "Spotify"

Scenario: Replace plugin
    Then I swipe right
    Then I press "icon"
    Then I press "PLUGINS"
    Then I press "Spotify"
    Then I see "Spotify"    
    Then I press "menu_button"
    Then I press "replace"
    Then I press "PLUGINS"
    Then I press "GMusic"
    Then I see "GMusic"

Scenario: Add plugin WebRadio
    Then I swipe right
    Then I press image view number 9
    Then I press "PLUGINS"
    Then I press "WebRadio"
    Then I see "WebRadio"
    
Scenario: Add multiple plugins 
    Then I swipe right
    Then I press image view number 10
    Then I press "PLUGINS"
    Then I press "Local Music"
    Then I see "Local Music"
    Then I press image view number 10
    Then I press "PLUGINS"
    Then I press "Where is My Car"
    Then I see "Where is My Car"

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

Scenario: Navigation plugin
    Then I press "navi_icon"