Feature: WebRadio



 Scenario: Long press Songs tab
  Then I press "skipButton"
  Then I press "button2"
  Then I swipe right
  Then I press "icon"
  Then I press "PLUGINS"
  Then I press "Local Music"
  Then I swipe right
  Then I press "icon"
  Then I press "Songs"
  Then I long press list item number 2
  Then I press "Jump to Album"
  And I see "#BeardyCast"
  Then I press "Jump to Artist"
  And I see "Alan Jackson"
  Then I press "Jump to Folder"
  And I see "Music"