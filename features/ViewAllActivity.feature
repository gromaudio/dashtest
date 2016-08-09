Feature: Home Activity

Scenario: View Side Menu
    Then I press "skipButton"
    Then I press "button2"
    Then I press "leftButtonFirst"
    Then I see "Settings"
    Then I see "About"
    Then I see "Exit"

Scenario: View Main Settings
    Then I press "leftButtonFirst"
    Then I press "Settings"
    Then I see "Units"
    And I see "Speed"
    And I see "Temperature"
    Then I see "Startup"
    And I see "Bluetooth connection"
    And I see "Bluetooth connections that will launch DashLinQ automatically"
    Then I see "Advanced functionality"
    And I see "Display Stay Awake"
    And I see "Screen will never sleep while charging"
    And I see "Show Quick Return icon"
    And I see "When other app is active the quick return icon will be shown at the side of the app. Icon can be adjusted in location via finger press and drag action."
    Then I see "Advertising"
    Then I scroll down
    Then I see "Car Integration"
    And I see "Disable USB Streaming"
    And I see "Disable USB when phone behaves incorrect or lagging"
    And I see "Find compatible device"
    And I see "Find the best GROM module for your vehicle. Direct integration and digital quality sound."

Scenario: View Settings components 
    Then I press "leftButtonFirst"
    Then I press "Settings"
    Then I see "MPH"
    Then I press "Speed"
    Then I see "KM/H"
    Then I see "℉"
    Then I press "Temperature"
    Then I see "℃"
    Then I press "Bluetooth connection"
    Then I see "To enable Bluetooth integration please enable Bluetooth in Settings"
    Then I see "Cancel"
    Then I see "Enable"
    Then I press "Cancel" 
    Then I press "Display Stay Awake"
    Then I press "Show Quick Return icon"
    Then I press "Sticky icon"
    Then I see "None"
    Then I see "Rotation lock" 
    Then I see "Brightness"
    Then I press "None"
    Then I press "Navigation"
    Then I see "Maps"
    Then I press "Maps"
    And I see "Maps"   

Scenario: View About section
    Then I press "leftButtonFirst"
    Then I press "About"
    Then I press "More options"
    And I see "Send Report Error"
    And I see "Send Feedback"   

Scenario: Start screen View
    Then I press "leftButtonFirst"
    Then I press "Settings"
    Then I scroll down
    Then I press "Find compatible device"
    Then I see "DashLinQ is a media player for car use. Gestures, large fonts and simple layout is perfect while driving. For seemless car integration use GROM module for your specific car." 
    Then I see "Choose your make/year for further instructions:"
    Then I see "If you are GROM customer press Skip and enjoy"
    Then I see "Select Car Make"
    Then I see "Select Year"
    Then I see "Select Model"

Scenario: Check default widget tabs
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

Scenario: View Voice Commands
    Then I press "voice_search"
    Then I see "Voice Commands"
    Then I see "Call"
    Then I see "Navigate"

Scenario: View Weather widget
    Then I press "weather_icon"
    Then I see "DAY"
    Then I see "EVENING"
    Then I see "NIGHT"
    Then I see "MORNING"
    Then I press "updateIndicator"
    Then I see "Lviv"      