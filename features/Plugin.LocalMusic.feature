Feature: Local Music Plugin
  You have to place "00 LocalMusicTestSuite" folder into sdcard/Music folder in order to run these tests.

  @debug
Scenario: Start
  Then I press "skipButton"
  Then I press "button2"

Scenario: Media rescan
  Then I press "icon"
  Then I press "leftButtonFirst"
  Then I press "Settings"
  Then I press "Media Rescan"
  Then I press "leftButtonFirst"
  Then I wait for 5 seconds
  Then I press "Playlists"
  Then I press "Folders"
  When I press "Music"
  Then I see "00 LocalMusicTestSuite"
  Then I see "30 songs"  
  When I press "00 LocalMusicTestSuite"

  Then I should see text containing "00 Fleetwood Mac"
  When I touch the "00 Fleetwood Mac" text
  Then I see "00 Rhiannon"
  And I see "00 Fleetwood Mac - 00 Greatest Hits"
  And I see "1/5 4:12"
  Then I see "01 Don\'t stop"
  And I see "2/5 3:10"
  Then I see "02 Go your own way"
  And I see "3/5 3:38"
  Then I scroll down
  Then I see "03 Hold Me"
  And I see "4/5 3:42"
  Then I see "04 Everywhere"
  And I see "5/5 3:42"
  Then I scroll up
  Then I press " .. "
  
  Then I should see text containing "01 Imagine Dragons"
  When I touch the "01 Imagine Dragons" text
  Then I see "00 Radioactive"
  And I see "01 Imagine Dragons - 01 Night Visions"
  And I see "1/1 3:06"
  Then I press " .. "

  Then I should see text containing "02 Nickelback - Dark"
  When I touch the "02 Nickelback - Dark" text
  Then I see "00 Shakin\' Hands"
  And I see "02 Nickelback - 02 Dark Horse"
  And I see "1/2 3:39"
  Then I see "01 S.E.X"
  And I see "2/2 3:53"
  Then I press " .. "

  Then I should see text containing "03 Red Hot Chili"
  When I touch the "03 Red Hot Chili" text
  Then I see "00 Around The World"
  And I should see text containing "03 Red Hot Chili Peppers"
  And I see "1/3 3:58"
  Then I see "01 Otherside"
  And I see "2/3 4:15"
  Then I see "02 Road Trippin\'"
  And I see "3/3 3:25"
  Then I press " .. "
  Then I scroll down

  Then I should see text containing "04 Taylor Swift"
  When I touch the "04 Taylor Swift" text
  Then I see "00 Mine"
  And I should see text containing "04 Taylor Swift - 04 Speak Now"
  And I see "1/3 3:50"
  Then I see "01 Sparks Fly"
  And I see "2/3 4:20"
  Then I see "02 Back To December"
  And I see "3/3 4:53"
  Then I press " .. "

  Then I should see text containing "05 The Beatles"
  When I touch the "05 The Beatles" text
  Then I should see text containing "00 Sgt. Pepper\'s"
  And I should see text containing "05 The Beatles"
  And I see "1/10 2:02"
  Then I should see text containing "01 With a Little Help"
  And I see "2/10 2:44"
  Then I should see text containing "02 Lucy in the Sky"
  And I see "3/10 3:28"
  Then I scroll until I see the "7/10 2:37" text
  Then I see "03 Getting Better"
  And I see "4/10 2:48"
  Then I see "04 Fixing a Hole"
  And I see "5/10 2:36"
  Then I see "05 She\'s Leaving Home"
  And I see "6/10 3:35"
  Then I scroll down
  Then I should see text containing "06 Being for the Benefit"
  And I see "7/10 2:37"
  Then I scroll until I see the "10/10 2:42" text
  Then I see "07 Within You Without You"
  And I see "8/10 5:04"
  Then I see "08 When I\'m Sixty-Four"
  And I see "9/10 2:37"
  Then I scroll down
  Then I see "09 Lovely Rita"
  And I see "10/10 2:42"
  Then I scroll up
  Then I scroll up
  Then I press " .. "
  Then I scroll down

  Then I should see text containing "06 Кирпичи - Камни"
  When I touch the "06 Кирпичи - Камни" text
  And I see "00 Летим По Кругу"
  Then I see "06 Кирпичи - 06 Камни"
  And I see "1/3 3:19"
  And I see "01 Вперед - Бодрит"
  And I see "2/3 2:59"
  And I see "02 Всё Для Народа"
  And I see "3/3 4:23"
  Then I press " .. "

  Then I should see text containing "07 The Police"
  When I touch the "07 The Police" text
  And I see "00 Message in a Bottle"
  Then I should see text containing "07 The Police - 07 Reggatta de Blanc"
  And I see "1/3 4:50"
  And I see "01 Reggatta de Blanc"
  And I see "2/3 3:05"
  And I see "02 It\'s Alright for You"
  And I see "3/3 3:12"
  Then I press " .. "
  Then I scroll up
  Then I scroll up
  Then I press " .. "
  Then I press " .. "

@debug
Scenario: Change "Music home folder" to Music
  Then I press "icon"
  Then I press "leftButtonFirst"
  Then I press "Settings"
  Then I press "Music home folder"
  Then I scroll until I see the "Music" text
  Then I press "Music"
  Then I press "Select"
  Then I press "Media Rescan"
  Then I press "leftButtonFirst"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"
  And I should see text containing "00 Fleetwood Mac"
  And I should see text containing "01 Imagine Dragons"
  And I should see text containing "02 Nickelback - Dark"
  And I should see text containing "03 Red Hot Chili"
  And I should see text containing "04 Taylor Swift"
  Then I scroll down
  And I should see text containing "05 The Beatles"
  And I should see text containing "06 Кирпичи - Камни"
  And I should see text containing "07 The Police"
  # Return back
  Then I press "leftButtonFirst"
  Then I press "Settings"
  Then I press "Music home folder"
  Then I press ".."
  Then I press "Select"
  Then I press "Media Rescan"
  Then I press "leftButtonFirst"
  Then I wait for 5 seconds
  Then I see "Music"

@debug
Scenario: Check if Albums tab contain items from LocalMusicTestSuite
  Then I press "icon"
  Then I press "leftButtonFirst"
  Then I press "Settings"
  Then I press "Music home folder"
  Then I scroll until I see the "Music" text
  Then I press "Music"
  Then I press "Select"
  Then I press "Media Rescan"
  Then I press "leftButtonFirst"
  Then I press "Albums"
  When I touch the "00 Greatest Hits" text
  Then I see "00 Rhiannon"
  And I see "01 Don\'t stop"
  And I see "02 Go your own way"
  And I see "03 Hold Me"
  And I see "04 Everywhere"
  Then I go back

  When I touch the "01 Night Visions" text
  Then I see "00 Radioactive"
  Then I go back

  When I touch the "02 Dark Horse" text
  Then I see "00 Shakin\' Hands"
  And I see "01 S.E.X."
  Then I go back

  When I touch the "03 Californication" text
  Then I see "00 Around The World"
  And I see "01 Otherside"
  And I see "02 Road Trippin\'"
  Then I go back

  Then I scroll down

  When I touch the "04 Speak Now" text
  Then I see "00 Mine"
  And I see "01 Sparks Fly"
  And I see "02 Back To December"
  Then I go back

  When I touch the "05 Sgt. Pepper\'s" text
  Then I should see text containing "00 Sgt. Pepper\'s"
  Then I should see text containing "01 With a Little Help"
  Then I should see text containing "02 Lucy in the Sky"
  Then I see "03 Getting Better"
  Then I see "04 Fixing a Hole"
  Then I scroll down
  Then I see "05 She\'s Leaving Home"
  Then I should see text containing "06 Being for the Benefit"
  Then I see "07 Within You Without You"
  Then I see "08 When I\'m Sixty-Four"
  Then I scroll down
  Then I see "09 Lovely Rita"
  Then I go back
  Then I scroll down

  When I touch the "06 Камни" text
  And I see "00 Летим По Кругу"
  And I see "01 Вперед - Бодрит"
  And I see "02 Всё Для Народа"
  Then I go back

  When I touch the "07 Reggatta de" text
  Then I see "00 Message in a Bottle"
  And I see "01 Reggatta de Blanc"
  And I see "02 It\'s Alright for You"
  Then I go back

  Then I scroll up
  Then I scroll up
  Then I scroll up
  Then I scroll up
  Then I scroll up

  Then I press "Playlists"
  Then I press "Folders"

  Then I press "leftButtonFirst"
  Then I press "Settings"
  Then I press "Music home folder"
  Then I press ".."
  Then I press "Select"
  Then I press "Media Rescan"
  Then I press "leftButtonFirst"
  Then I wait for 5 seconds
  Then I see "Music"

@debug
Scenario: Check if Artists tab contain items from LocalMusicTestSuite
  Then I press "icon"
  Then I press "leftButtonFirst"
  Then I press "Settings"
  Then I press "Music home folder"
  Then I scroll until I see the "Music" text
  Then I press "Music"
  Then I press "Select"
  Then I press "Media Rescan"
  Then I press "leftButtonFirst"
  Then I press "Albums"
  Then I press "Artists"
  Then I see "00 Fleetwood Mac"
  And I see "1 album, 5 songs out of 5"
  Then I press "00 Fleetwood Mac"
  And I should see text containing "00 Greatest Hits"
  Then I press "00 Fleetwood Mac"

  Then I see "01 Imagine Dragons"
  And I see "1 album, 1 song out of 1"
  Then I press "01 Imagine Dragons"
  And I see "01 Night Visions"
  Then I press "01 Imagine Dragons"

  Then I see "02 Nickelback"
  And I see "1 album, 2 songs out of 2"
  Then I press "02 Nickelback"
  And I see "02 Dark Horse"
  Then I press "02 Nickelback"

  Then I see "03 Red Hot Chili Peppers"
  And I see "1 album, 2 songs out of 3"
  Then I press "03 Red Hot Chili Peppers"
  And I see "03 Californication"
  Then I press "03 Red Hot Chili Peppers"

  Then I scroll down

  Then I see "04 Taylor Swift"
  And I see "1 album, 3 songs out of 3"
  Then I press "04 Taylor Swift"
  And I should see text containing "04 Speak Now"
  Then I press "04 Taylor Swift"

  Then I see "05 The Beatles"
  And I see "1 album, 10 songs out of 10"
  Then I press "05 The Beatles"
  And I should see text containing "05 Sgt. Pepper\'s"
  Then I press "05 The Beatles"

  Then I scroll down

  Then I see "06 Кирпичи"
  And I see "1 album, 3 songs out of 3"
  Then I press "06 Кирпичи"
  And I see "06 Камни"
  Then I press "06 Кирпичи"

  Then I see "07 The Police"
  And I see "1 album, 3 songs out of 3"
  Then I press "07 The Police"
  And I see "07 Reggatta de Blanc"
  Then I press "07 The Police"

  Then I scroll up
  Then I scroll up
  Then I scroll up
  Then I scroll up
  Then I scroll up
  
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"

  Then I press "leftButtonFirst"
  Then I press "Settings"
  Then I press "Music home folder"
  Then I press ".."
  Then I press "Select"
  Then I press "Media Rescan"
  Then I press "leftButtonFirst"
  Then I wait for 5 seconds
  Then I see "Music"

@debug
Scenario: Check if Songs tab contain items from LocalMusicTestSuite
  Then I press "icon"
  Then I press "leftButtonFirst"
  Then I press "Settings"
  Then I press "Music home folder"
  Then I scroll until I see the "Music" text
  Then I press "Music"
  Then I press "Select"
  Then I press "Media Rescan"
  Then I press "leftButtonFirst"
  Then I press "Albums"
  Then I press "Artists"
  When I press "Songs"
  Then I see "00 Around The World"
  And I see "03 Red Hot Chili Peppers"
  And I see "3:58"

  Then I see "00 Message in a Bottle"
  And I see "07 The Police"
  And I see "4:50"

  Then I see "00 Mine"
  And I see "04 Taylor Swift"
  And I see "3:50"

  Then I see "00 Radioactive"
  And I see "01 Imagine Dragons"
  And I see "3:06"

  Then I scroll down

  Then I see "00 Rhiannon"
  And I see "00 Fleetwood Mac"
  And I see "4:12"

  Then I see "00 Sgt. Pepper\'s"
  And I see "05 The Beatles"
  And I see "2:02"

  Then I see "00 Shakin\' Hands"
  And I see "02 Nickelback"
  And I see "3:39"

  Then I see "00 Летим По Кругу"
  And I see "06 Кирпичи"
  And I see "3:19"

  Then I scroll down

  Then I see "01 Don\'t Stop"
  And I see "00 Fleetwood Mac"
  And I see "3:10"

  Then I see "01 Otherside"
  And I see "03 Red Hot Chili Peppers"
  And I see "4:15"

  Then I see "01 Reggatta de Blanc"
  And I see "07 The Police"
  And I see "3:05"

  Then I see "01 S.E.X."
  And I see "02 Nickelback"
  And I see "3:53"

  Then I scroll down

  Then I see "01 Sparks Fly"
  And I see "04 Taylor Swift"
  And I see "4:20"

  Then I see "01 With a Little Help"
  And I see "5 The Beatles"
  And I see "2:44"

  Then I see "01 Вперед - Бодрит"
  And I see "06 Кирпичи - 06 Камни"
  And I see "2:59"

  Then I see "02 Back To December"
  And I see "04 Taylor Swift"
  And I see "4:53"

  Then I scroll down

  Then I see "02 Go Your Own Way"
  And I see "00 Fleetwood Mac"
  And I see "3:38"

  Then I see "02 It\'s Alright for You"
  And I see "07 The Police"
  And I see "3:12"

  Then I see "02 Lucy in the Sky"
  And I see "05 The Beatles"
  And I see "3:28"

  Then I see "02 Road Trippin\'"
  And I see "03 Red Hot Chili Peppers"
  And I see "3:25"

  Then I scroll down

  Then I see "02 Всё Для Народа"
  And I see "06 Кирпичи - 06 Камни"
  And I see "4:23"

  Then I see "03 Getting Better"
  And I see "05 The Beatles"
  And I see "2:48"

  Then I see "03 Hold Me"
  And I see "00 Fleetwood Mac"
  And I see "3:42"

  Then I see "04 Everywhere"
  And I see "00 Fleetwood Mac"
  And I see "3:42"

  Then I scroll down

  Then I see "04 Fixing a Hole"
  And I see "05 The Beatles"
  And I see "2:36"

  Then I see "05 She\'s Leaving Home"
  And I see "05 The Beatles"
  And I see "3:35"

  Then I see "06 Being for the"
  And I see "05 The Beatles"
  And I see "2:37"

  Then I see "07 Within You Without"
  And I see "05 The Beatles"
  And I see "5:04"

  Then I scroll down

  Then I see "08 When I\'m Sixty-Four"
  And I see "05 The Beatles"
  And I see "2:37"

  Then I see "09 Lovely Rita"
  And I see "05 The Beatles"
  And I see "2:42"

  Then I scroll up
  Then I scroll up
  Then I scroll up
  Then I scroll up
  Then I scroll up
  Then I scroll up
  Then I scroll up
  Then I scroll up
  Then I scroll up
  Then I scroll up

  Then I press "Artists"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"

Scenario: Check tabs and About
  Then I press "icon"
  Then I wait for 3 seconds
  Then I see "Folders"
  Then I see "Playlists"
  Then I see "Albums"
  Then I see "Artists"
  Then I press "Artists"
  Then I see "Songs"
  Then I see "Search"
  Then I press "Artists"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"
  Then I press "leftButtonFirst"
  Then I press "About"
  Then I see "Local music player for DashLinQ. Plays local tracks, automatic cover art update and voice search."
  And I see "Copyright GROM Audio 2015"

Scenario: Local Music Settings
  Then I press "icon"
  Then I press "leftButtonFirst"
  Then I press "Settings"
  Then I see "General"
  Then I see "Gestures"
  And I see "Learn/reassign which gestures do what. Random, Repeat, browse options, extra menus, equalizer and many more is accessible via gestures !"
  When I press "Gestures"
  Then I see "CHANGEABLE ACTIONS"
  And I see "Show track information, file size, bitrate etc"
  And I see "Toggle Random on/off"
  And I see "Return to Library"
  And I see "Next category. Folder, Playlist, Album, Artist"
  And I see "Prev category. Folder, Playlist, Album, Artist"
  Then I see "FIXED ACTIONS"
  And I see "Previous Track"
  And I see "Next Track"
  And I see "Show Playing Now tracks"
  Then I scroll down
  And I see "Update cover art from internet"
  Then I press "leftButtonFirst" 
  Then I see "AutoHide Panels"
  And I see "Hide Navigation panels when browsing long lists to free up more space for text data"
  Then I see "Library Side Swipe"
  And I see "Enable side swipe for faster library navigation"
  Then I see "Cover art resources"
  And I see "Change order of how cover art is searched"
  When I press "Cover art resources"
  Then I see "Lastfm"
  Then I see "Musicbrainz"
  And I see "Save"
  And I see "Cancel"
  Then I go back
  Then I see "Folders"
  And I see "Music home folder"
  Then I see "Indexing"
  And I see "Media Rescan"

Scenario: Play/Pause Music (Folders tab)
  Then I press "icon"
  Then I press "Playlists"
  Then I press "Folders"
  When I touch the "00 Fleetwood Mac" text
  Then I scroll up
  Then I press "00 Rhiannon"
  Then I press "slide_panel_now_playing_title"
  Then I should see text containing "00 Rhiannon - 00 Greatest Hits"
  Then I see "00 Fleetwood Mac"
  And I see "4:12"
  And I see "1/5"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing
  Then I press "pause"
  Then I press "actionBackArrow"
  Then I scroll up
  Then I press " .. "
  
Scenario: Play/Pause Music - long press (Folders tab)
  Then I press "icon"
  Then I press "Playlists"
  Then I press "Folders"
  When I touch the "01 Imagine Dragons" text
  Then I long press "00 Radioactive"
  Then I press "Play"
  Then I press "slide_panel_now_playing_title"
  Then I should see text containing "00 Radioactive - 01 Night Visions"
  Then I see "01 Imagine Dragons"
  And I see "3:06"
  And I see "1/1"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing
  Then I press "pause"
  Then I press "actionBackArrow"
  Then I press " .. "

Scenario: Play/Pause Music (Playlists tab)
  Then I press "icon"
  Then I press "Playlists"
  Then I press "Folders"
  When I touch the "00 Fleetwood Mac" text
  Then I scroll up
  Then I long press "00 Rhiannon"
  Then I press "Add to playlist"
  Then I press "New"
  Then I press "Save"
  Then I press " .. "
  Then I press "Playlists"
  Then I press "00 Rhiannon"
  Then I touch the "Fleetwood Mac" text
  When I press "slide_panel_now_playing_title"
  Then I see "4:12"
  And I see "1/1"
  And I should see text containing "00 Rhiannon - 00 Greatest Hits"
  And I see "00 Fleetwood Mac"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing
  Then I press "pause"
  Then I press "actionBackArrow"
  Then I wait for 1 second
  Then I go back
  Then I long press "00 Rhiannon"
  Then I press "Delete"

Scenario: Play/Pause Music - long press (Playlists tab)
  Then I press "icon"
  Then I press "Playlists"
  Then I press "Folders"
  When I touch the "00 Fleetwood Mac" text
  Then I long press "01 Don\'t Stop"
  Then I press "Add to playlist"
  Then I press "New"
  Then I press "Save"
  Then I press " .. "
  Then I press "Playlists"
  Then I long press "01 Don\'t Stop"
  Then I press "Play"
  When I press "slide_panel_now_playing_title"
  Then I see "3:10"
  And I see "1/1"
  And I should see text containing "01 Don\'t Stop - 00 Greatest Hits"
  And I see "00 Fleetwood Mac"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing
  Then I press "pause"
  Then I press "actionBackArrow"
  Then I long press "01 Don\'t Stop"
  Then I press "Delete"

Scenario: Play/Pause Music (Albums tab)
  Then I press "icon"
  Then I press "Playlists"
  Then I press "Albums"
  Then I scroll up
  Then I press "02 Dark Horse"
  Then I press "00 Shakin\' Hands"
  When I press "slide_panel_now_playing_title"
  Then I see "02 Nickelback"
  And I should see text containing "00 Shakin\' Hands - 02 Dark"
  And I see "3:39"
  And I see "1/2"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing
  Then I press "pause"
  Then I press "actionBackArrow"
  Then I wait for 1 second
  Then I go back

Scenario: Play/Pause Music - long press (Albums tab)
  Then I press "icon"
  Then I press "Playlists"
  Then I press "Albums"
  Then I scroll up
  Then I press "02 Dark Horse"
  Then I long press "01 S.E.X."
  Then I press "Play"
  When I press "slide_panel_now_playing_title"
  Then I see "02 Nickelback"
  And I should see text containing "01 S.E.X. - 02 Dark Horse"
  And I see "3:53"
  And I see "2/2"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing
  Then I press "pause"
  Then I press "actionBackArrow"
  Then I wait for 1 second
  Then I go back

Scenario: Play/Pause Music (Artists tab)
  Then I press "icon"
  Then I press "Playlists"
  Then I press "Artists"
  Then I press "01 Imagine Dragons"
  Then I touch the "01 Night Visions" text
  Then I press "00 Radioactive"
  When I press "slide_panel_now_playing_title"
  Then I see "01 Imagine Dragons"
  And I should see text containing "00 Radioactive - 01 Night Visions"
  And I see "3:06"
  And I see "1/1"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing
  Then I press "pause"
  Then I press "actionBackArrow"
  Then I wait for 1 second
  Then I go back

Scenario: Play/Pause Music - long press (Artists tab)
  Then I press "icon"
  Then I press "Playlists"
  Then I press "Artists"
  Then I press "00 Fleetwood Mac"
  Then I touch the "00 Greatest Hits [Reprise]" text
  Then I long press "00 Rhiannon"
  Then I press "Play"
  When I press "slide_panel_now_playing_title"
  Then I see "00 Fleetwood Mac"
  And I should see text containing "00 Rhiannon - 00 Greatest Hits [Reprise]"
  And I see "4:12"
  And I see "1/5"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing
  Then I press "pause"
  Then I press "actionBackArrow"
  Then I wait for 1 second
  Then I go back

Scenario: Play/Pause Music (Songs tab)
  Then I press "icon"
  Then I press "Playlists"
  Then I press "Artists"
  Then I press "Songs"
  Then I press "00 Around The World"
  When I press "slide_panel_now_playing_title"
  Then I see "03 Red Hot Chili Peppers"
  And I should see text containing "00 Around The World"
  And I see "3:58"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing
  Then I press "pause"
  Then I go back
  Then I press "Artists"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"

Scenario: Play/Pause Music - long press (Songs tab)
  Then I press "icon"
  Then I press "Playlists"
  Then I press "Artists"
  Then I press "Songs"
  Then I long press "00 Message in a Bottle"
  Then I press "Play"
  When I press "slide_panel_now_playing_title"
  Then I see "07 The Police"
  And I should see text containing "00 Message in a Bottle"
  And I see "4:50"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing
  Then I press "pause"
  Then I go back
  Then I press "Artists"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"

Scenario: Switching between tracks
  Then I press "icon"
  Then I press "Playlists"
  Then I press "Folders"
  When I touch the "00 Fleetwood Mac" text
  Then I press "01 Don\'t Stop"
  Then I press "slide_panel_now_playing_title"
  Then I see "01 Don\'t stop"
  Then I see "2/5"
  When I press "next_control"
  Then I see "02 Go Your Own Way"
  Then I see "3/5"
  When I press "next_control"
  Then I see "03 Hold Me"
  Then I see "4/5"
  When I press "prev_control"
  Then I see "02 Go Your Own Way"
  Then I see "3/5"
  When I press "prev_control"
  Then I see "01 Don\'t stop"
  Then I see "2/5"
  Then I press "pause"
  Then I go back
  Then I scroll up
  Then I press " .. "
  # When I swipe right
  # Then I see "3/5"
  # When I swipe right
  # Then I see "4/5"

# FIXME: Check if track switching is working by cover right/left slides
# DONE 50% (Need test for swipe right/left)

# FIXME: Ensure that by tap on cover current folder opens - check folder title and existence of some tracks, Don't check highlights for now

Scenario: Long press actions - Add/Rename/Delete (Playlists tab)
  Then I press "icon"
  Then I press "Playlists"
  Then I press "Folders"
  Then I long press "00 Fleetwood Mac"
  And I see "Play"
  And I see "Add to playlist"
  Then I press "Add to playlist"
  And I see "Add to playlist"
  And I see "Add to On The Go"
  And I see "NEW"
  Then I press "New"
  And I see "Save"
  And I see "Cancel"
  Then I clear "playlist"
  Then I enter text "Fleetwood Mac" into field with id "playlist"
  # To hide keyboard
  Then I go back
  Then I press "Save"
  Then I press "Playlists"
  And I should see text containing "Fleetwood Mac"
  Then I press "Fleetwood Mac"
  And I see "00 Rhiannon"
  And I see "01 Don\'t Stop"
  And I see "02 Go Your Own Way"
  And I see "03 Hold Me"
  And I see "04 Everywhere"
  Then I go back
  Then I long press "Fleetwood Mac"
  And I see "Play"
  And I see "Add to playlist"
  And I see "Play from the beginning"
  And I see "Play from the saved position"
  And I see "Delete"
  And I see "Rename"
  Then I press "Rename"
  Then I clear "playlist"
  Then I enter text "Custom" into field with id "playlist"
  Then I go back
  Then I press "Save"
  And I see "Custom"
  Then I long press "Custom"
  Then I press "Delete"
  And I don't see "Custom"
  Then I press "Folders"

Scenario: Long press actions - Play From the ... (Playlists tab)
  Then I press "icon"
  Then I long press "00 Fleetwood Mac"
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "Fleetwood Mac" into field with id "playlist"
  # To hide keyboard
  Then I go back
  Then I press "Save"
  Then I press "Playlists"
  Then I long press "Fleetwood Mac"
  Then I press "Play from the beginning"
  Then I press "slide_panel_now_playing_title"
  And I should see text containing "00 Rhiannon - 00 Greatest Hits"
  And I see "4:12"
  And I see "1/5"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing
  Then I press "next_control"
  Then I press "next_control"
  And I see "02 Go Your Own Way"
  And I see "3/5"
  Then I go back
  Then I wait for 1 second
  Then I go back
  Then I press "On The Go"
  Then I press list item number 1
  Then I go back
  Then I long press "Fleetwood Mac"
  When I press "Play from the saved position"
  Then I press "slide_panel_now_playing_title"
  And I should see text containing "02 Go Your Own Way"
  And I see "3/5"
  And I see "3:38"
  Then I press "pause"
  Then I go back
  Then I wait for 1 second
  Then I go back
  Then I press "Folders"

# FIXME: Ensure Playlists/"Add to playlist" option from long press menu is working too
# DONE
Scenario: Long press actions - Add to playlist from playlist tab
  Then I press "icon"
  Then I long press "00 Fleetwood Mac"
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "Fleetwood Mac" into field with id "playlist"
  # To hide keyboard
  Then I go back
  Then I press "Save"
  Then I press "Playlists"
  And I should see text containing "Fleetwood Mac"
  Then I press "Fleetwood Mac"
  And I see "00 Rhiannon"
  And I see "01 Don\'t Stop"
  And I see "02 Go Your Own Way"
  And I see "03 Hold Me"
  And I see "04 Everywhere"
  Then I go back
  Then I long press "Fleetwood Mac"
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "Fleetwood Copy" into field with id "playlist"
  # To hide keyboard
  Then I go back
  Then I press "Save"
  Then I see "Fleetwood Copy"
  Then I press "Fleetwood Copy"
  And I see "00 Rhiannon"
  And I see "01 Don\'t Stop"
  And I see "02 Go Your Own Way"
  And I see "03 Hold Me"
  And I see "04 Everywhere"
  Then I go back
  Then I long press "Fleetwood Copy"
  Then I press "Delete"
  Then I long press "Fleetwood Mac"
  Then I press "Delete"

Scenario: Long press actions - Add/Delete playlist from Albums tab
  Then I press "icon"
  Then I press "Albums"
  Then I long press "02 Dark Horse"
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "From_Albums" into field with id "playlist"
  Then I go back
  Then I press "Save"
  Then I press "Playlists"
  And I see "From_Albums"
  When I press "From_Albums"
  Then I see "00 Shakin\' Hands"
  And I see "1/2 3:39"
  And I see "01 S.E.X."
  And I see "2/2 3:53"
  Then I go back
  Then I long press "From_Albums"
  Then I press "Delete"
  Then I don't see "From_Albums"
   
# FIXME: ensure created playlist contains appropriate tracks
# DONE
Scenario: Long press actions - Add/Delete playlist from Artists tab
  Then I press "icon"
  Then I press "Albums"
  Then I press "Artists"
  Then I long press "01 Imagine Dragons"
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear input field with id "playlist"
  Then I enter text "From_Artists" into field with id "playlist"
  Then I go back
  Then I press "Save"
  Then I press "Albums"
  When I press "Playlists"
  Then I see "From_Artists"
  When I press "From_Artists"
  Then I see "00 Radioactive"
  And I see "1/1 3:06"
  Then I go back
  Then I long press "From_Artists"
  Then I press "Delete"
  Then I don't see "From_Artists"

# FIXME: ensure created playlist contains appropriate tracks
# DONE
Scenario: Long press actions - Add/Delete playlist from Songs tab
  Then I press "icon"
  Then I press "Albums"
  Then I press "Artists"
  Then I press "Songs"
  Then I long press "00 Mine"
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear input field with id "playlist"
  Then I enter text "From_Songs" into field with id "playlist"
  Then I go back
  Then I press "Save"
  Then I press "Albums"
  When I press "Playlists"
  And I see "From_Songs"
  Then I press "From_Songs"
  And I see "00 Mine"
  And I see "1/1 3:50"
  Then I go back
  Then I long press "From_Songs"
  Then I press "Delete"
  Then I don't see "From_Songs"

Scenario: Long press actions - Jum to .. (Songs tab)
  Then I press "icon"
  Then I press "Artists"
  Then I press "Songs"
  Then I long press "00 Around The World"
  Then I press "Jump to Album"
  Then I wait for 3 seconds
  And I see "03 Californication"
  And I see "00 Around The World"
  And I see "01 Otherside"
  And I see "02 Road Trippin\'"
  Then I go back
  Then I press "Artists"
  Then I press "Songs"
  Then I long press "00 Radioactive"
  Then I press "Jump to Artist"
  Then I wait for 3 seconds
  And I see "01 Imagine Dragons"
  And I see "01 Night Visions"
  And I see "1 song"
  Then I press "Songs"
  Then I long press "00 Message in a Bottle"
  Then I press "Jump to Folder"
  Then I wait for 3 seconds
  Then I see "00 Message in a Bottle"
  And I see "01 Reggatta de Blanc"
  And I see "02 It\'s Alright for You"
  Then I press " .. "

# FIXME: use track names instead of numbers
# DONE

Scenario: Long press actions - Jum to Folder (Albums tab)
  Then I press "icon"
  Then I press "Albums"
  Then I scroll up
  Then I press "02 Dark Horse"
  Then I long press "01 S.E.X."
  Then I press "Jump to Folder"
  Then I wait for 3 seconds
  And I see "00 Shakin\' Hands"
  And I see "1/2 3:39"
  And I see "01 S.E.X."
  And I see "2/2 3:53"
  And I press " .. "

Scenario: Long press actions - Jum to Folder (Artists tab)
  Then I press "icon"
  Then I press "Albums"
  Then I press "Artists"
  Then I press "02 Nickelback"
  Then I press "02 Dark Horse"
  Then I long press "01 S.E.X."
  Then I press "Jump to Folder"
  Then I wait for 3 seconds
  And I see "00 Shakin\' Hands"
  And I see "1/2 3:39"
  And I see "01 S.E.X."
  And I see "2/2 3:53"
  And I press " .. "

Scenario: Top layout menu (Home icon)
  Then I press "icon"
  Then I wait for 2 seconds
  Then I press "topContentContainer"
  Then I press "firstButtonLayout"
  And I see "WebRadio"
  And I see "Driving Mode"

Scenario: Top layout menu (Voice commands icon)
  Then I press "icon"
  Then I wait for 2 seconds
  Then I press "topContentContainer"
  Then I press "thirdButtonLayout"
  And I see "Call"
  And I see "Navigate" 

Scenario: Exit option
  Then I press "icon"
  Then I press "leftButtonFirst"
  Then I press "Exit"
  Then I see "Where is My Car"
  Then I see "WebRadio"