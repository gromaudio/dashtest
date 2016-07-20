Feature: Local Music (Long press)

Scenario: Long press actions
  Then I press "skipButton"
  Then I press "button2"
  Then I swipe right
  Then I press "icon"
  Then I press "PLUGINS"
  Then I press "Local Music"
  Then I press "icon"
  Then I long press "Music"
  And I see "Play"
  And I see "Add to playlist"
  Then I press "Add to playlist"
  And I see "Add to playlist"
  And I see "Add to On The Go"
  And I see "NEW"
  Then I press "New"
  And I see "Save"
  And I see "Cancel"
  And I see "Music"
  Then I press "Save"
  Then I press "Playlists"
  And I see "Music"
  Then I long press "Music"
  And I see "Play"
  And I see "Add to playlist"
  And I see "Play from the beginning"
  And I see "Play from the saved position"
  And I see "Delete"
  And I see "Rename"
  Then I press "Rename"
  Then I clear "Music"
  Then I enter text "Custome" into field with id "playlist"
  Then I go back
  Then I press "Save"
  And I see "Custome"

Scenario: Delete Playlist
  Then I swipe right
  Then I press "icon"
  Then I long press "Music"
  Then I press "Add to playlist"
  Then I press "New"
  Then I press "Save"
  Then I press "Playlists"
  Then I long press "Music"
  Then I press "Delete"
  Then I don't see "Music"