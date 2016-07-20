Feature: Menu options

Scenario: Settings (Brightness)
    Then I press "skipButton"
    Then I press "button2"
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
   
Scenario: Settings (Speed & Temperature)
    Then I press "weather_icon"
    Then I see "℉"
    Then I see "mph"
    Then I press "leftButtonFirst"
    Then I press "leftButtonFirst"
    Then I press "Settings"
    Then I press "Speed"
    Then I press "Temperature"
    Then I press "leftButtonFirst"
    Then I press "weather_icon"
    Then I see "℃"
    Then I see "kmph"

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
    