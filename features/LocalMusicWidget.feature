Feature: Settings Local

Scenario: Library Side Swipe
  Then I press "skipButton"
  Then I press "button2"
  Then I swipe right
  Then I press "icon"
  Then I press "PLUGINS"
  Then I press "Local Music"
  Then I swipe right
  Then I press "icon"
  Then I see "Music"
  And I see "4 songs"
  Then I press "Music"
  Then I see "Join Me In Death"
  Then I swipe left
  And I see "Music"

 Scenario: Media rescan
  Then I swipe right
  Then I press "icon"
  Then I press " .. "
  Then I see "4 songs"
  Then I press "leftButtonFirst"
  Then I press "Settings"
  Then I press "Media Rescan"
  Then I press "leftButtonFirst"
  Then I see "4 songs"  

Scenario: Check tabs and About
  Then I swipe right
  Then I press "icon"
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
  Then I swipe right
  Then I press "icon"
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
  Then I swipe right
  Then I press "icon"
  Then I press "Music"
  Then I press "Join Me In Death" 

Scenario: Long press Songs tab
  Then I swipe right
  Then I press "icon"
  Then I press "PLUGINS"
  Then I press "Local Music"
  Then I swipe right
  Then I press "icon"
  Then I press "Songs"
  Then I long press list item number 1
  Then I see "Play"
  Then I see "Add to playlist"
  Then I see "Jump to Album"
  Then I see "Jump to Artist"
  Then I see "Jump to Folder"
  Then I see "Update cover art"  

