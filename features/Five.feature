Feature: Multipple widgets

  Scenario: Add 2 widgets 
    Then I press "skipButton"
    Then I press "button2"
    Then I swipe right
    Then I press image view number 10
    Then I press "Calendar"
    Then I press image view number 10
    Then I press "Calculator"
    Then I take a screenshot


  Scenario: Landscape
    Then I set screen to landscape  
    Then I take a screenshot