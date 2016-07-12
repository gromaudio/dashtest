Feature: Weather feature

  Scenario: Weather
    Then I press "skipButton"
    Then I press "button2"
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

  Scenario: Weather section
    Then I press "weather_icon"
    Then I see "DAY"
    Then I see "EVENING"
    Then I see "NIGHT"
    Then I see "MORNING"
    Then I press "updateIndicator"
    Then I see "Lviv"  