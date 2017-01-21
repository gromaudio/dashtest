Feature: Emulator

@debug
Scenario: Start
  Then I press "skipButton"
  Then I press "button2"
  Then I press "icon"
  Then I press "leftButtonFirst"
  Then I press "Settings"
  Then I scroll to "Music home folder" text
  Then I press "Music home folder"
  Then I scroll to "Music" text
  Then I press "Music"
  Then I press "01 LocalMusicTestSuite"
  Then I press "Select"
  Then I scroll up
  Then I press "AutoHide Panels"
  Then I press "leftButtonFirst"

Scenario: Play track
  Then I start emulator server
  Then I press "icon"
  Then I start emulator command "PL"
  Then I see text "01 Message in a Bottle 02 The Police Reggatta" in emulator output
  Then I start emulator command "TRACK 1"
  Then I see text "01 Mine 03 Taylor Swift Speak Now" in emulator output
  Then I start emulator command "TRACK 5"
  Then I see text "02 Sparks Fly 03 Taylor Swift Speak Now" in emulator output
  



  