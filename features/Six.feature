Feature: Settings Local

  Scenario: Media rescan
    Then I press "skipButton"
    Then I press "button2"
    Then I press image view number 6
    Then I see "16 songs"
    Then I press "leftButtonFirst"
    Then I press "Settings"
    Then I press "Media Rescan"
    Then I press "leftButtonFirst"
    Then I see "16 songs"

  Scenario: Check tabs and About
    Then I press image view number 6
    Then I see "Folders"
    Then I see "Playlists"
    Then I see "Albums"
    Then I see "Artists"
    Then I press "Artists"
    Then I see "Songs"
    Then I see "Search"
    Then I press "leftButtonFirst"
    Then I press "About"
    Then I see "Local music player for DashLinQ. Plays local tracks, automatic cover art update and voice search."
    And I see "Copyright GROM Audio 2015"
    
  Scenario: Local Settings 
    Then I press image view number 6
    Then I press "leftButtonFirst"
    Then I press "Settings"
    Then I see "General"
    And I see " Gestures"
    And I see "AutoHide Panels"
    And I see "Library Side Swipe"
    And I see "Cover art resources"
    Then I see "Folders"
    And I see "Music home folder"
    Then I see "Indexing"
    And I see "Media Rescan" 

  Scenario: Music
    Then I press "skipButton"
    Then I press "button2"
    Then I press image view number 6
    Then I press "Music"
    Then I press "Hans Zimmer - Chappie"  