Feature: Menu options

  Scenario: Settings check
    Then I press "skipButton"
    Then I press "button2"
    Then I press "leftButtonFirst"
    Then I press "Settings"
    Then I press "Speed"
    Then I press "Temperature"
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
    Then I press "Rotation lock"
    Then I press "Navigation"
    Then I see "Maps"
    Then I press "Maps"
    Then I scroll down
    Then I press "Disable USB Streaming"

  Scenario: Setings sections
    Then I press "leftButtonFirst"
    Then I press "Settings"
    Then I see "Units"
    Then I see "Startup"
    Then I see "Advanced functionality"
    Then I see "Advertising"
    Then I scroll down
    Then I see "Car Integration"

  Scenario: Settings (Find compatible device)
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

  Scenario: Settings (Brightness)
    Then I press "leftButtonFirst"
    Then I press "Settings"
    Then I press "Sticky icon"
    Then I press "Brightness"
    Then I press "leftButtonFirst"
    Then I press "leftButtonSecond"
    Then I press "leftButtonSecond"
    Then I press "leftButtonSecond"
    Then I press "leftButtonSecond"

  Scenario: Settings (Rotation lock)
    Then I press "leftButtonFirst"
    Then I press "Settings"
    Then I press "Sticky icon"
    Then I press "Rotation lock"
    Then I press "leftButtonFirst"
    Then I press "leftButtonSecond"
    Then I press "leftButtonSecond"

  Scenario: Exit check
    Then I press "leftButtonFirst"
    Then I press "Exit"

  Scenario: About check (Send Report Error)  
    Then I press "leftButtonFirst"
    Then I press "About"
    Then I press "More options"
    Then I press "Send Report Error"

  Scenario: About check (Send Feedback)
    Then I press "leftButtonFirst"
    Then I press "About"
    Then I press "More options"
    Then I press "Send Feedback"