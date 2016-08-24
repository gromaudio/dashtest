Feature: Local Music Settings 
  You have to place LocalMusicTestSuite folder into sdcard/Music folder in order to run these tests.

# FIXME: !!! Please use LocalMusicTestSuite items for all tests with folders/songs/artists/albums etc, since we must have common setup !!!
# DONE

# FIXME: we should test if rescan completed successfully by traversing all the folders/songs from LocalMusicTestSuite and checking its info
# DONE

Scenario: Media rescan
  Then I press "skipButton"
  Then I press "button2"
  Then I press "icon"
  Then I press "leftButtonFirst"
  Then I press "Settings"
  Then I press "Media Rescan"
  Then I press "leftButtonFirst"
  Then I wait for 5 seconds
  Then I press "Playlists"
  Then I press "Folders"
  When I press "Music"
  Then I see "LocalMusicTestSuite"
  Then I see "30 songs"  
  When I press "LocalMusicTestSuite"

  Then I should see text containing "00 Fleetwood Mac"
  When I touch the "00 Fleetwood Mac" text
  Then I see "Rhiannon"
  And I see "Fleetwood Mac - Greatest Hits"
  And I see "1/5 4:12"
  Then I see "Don\'t stop"
  And I see "2/5 3:10"
  Then I see "Go your own way"
  And I see "3/5 3:38"
  Then I see "Hold Me"
  And I see "4/5 3:42"
  Then I scroll down
  Then I see "Everywhere"
  And I see "5/5 3:42"
  Then I scroll up
  Then I press " .. "
  
  Then I should see text containing "01 Imagine Dragons"
  When I touch the "01 Imagine Dragons" text
  Then I see "Radioactive"
  And I see "Imagine Dragons - Night Visions"
  And I see "1/1 3:06"
  Then I press " .. "

  Then I should see text containing "02 Nickelback - Dark"
  When I touch the "02 Nickelback - Dark" text
  Then I see "Shakin\' Hands"
  And I see "Nickelback - Dark Horse"
  And I see "1/2 3:39"
  Then I see "S.E.X"
  And I see "2/2 3:53"
  Then I press " .. "

  Then I should see text containing "03 Red Hot Chili"
  When I touch the "03 Red Hot Chili" text
  Then I see "Around The World"
  And I should see text containing "Red Hot Chili Peppers - Cali"
  And I see "1/3 3:58"
  Then I see "Otherside"
  And I see "2/3 4:15"
  Then I see "Road Trippin\'"
  And I see "3/3 3:25"
  Then I press " .. "

  Then I should see text containing "04 Taylor Swift"
  When I touch the "04 Taylor Swift" text
  Then I see "Mine"
  And I should see text containing "Taylor Swift - Speak Now"
  And I see "1/3 3:50"
  Then I see "Sparks Fly"
  And I see "2/3 4:20"
  Then I see "Back To December"
  And I see "3/3 4:53"
  Then I press " .. "
  Then I scroll down 

  Then I should see text containing "05 The Beatles"
  When I touch the "05 The Beatles" text
  Then I should see text containing "Sgt. Pepper\'s"
  And I see "1/10 2:02"
  Then I should see text containing "With a Little Help"
  And I see "2/10 2:44"
  Then I should see text containing "Lucy in the Sky"
  And I see "3/10 3:28"
  Then I see "Getting Better"
  And I see "4/10 2:48"
  Then I see "Fixing a Hole"
  Then I scroll down
  And I see "5/10 2:36"
  Then I see "She\'s Leaving Home"
  And I see "6/10 3:35"
  Then I should see text containing "Being for the Benefit"
  And I see "7/10 2:37"
  Then I see "Within You Without You"
  And I see "8/10 5:04"
  Then I see "When I\'m Sixty-Four"
  And I see "9/10 2:37"
  Then I scroll down
  Then I see "Lovely Rita"
  And I see "10/10 2:42"
  Then I scroll up
  Then I press " .. "
  Then I scroll down

  Then I should see text containing "07 Кирпичи - Камни"
  When I touch the "07 Кирпичи - Камни" text
  Then I see "Кирпичи - Камни"
  And I see "Летим По Кругу"
  And I see "1/3 3:19"
  And I see "Вперед - Бодрит"
  And I see "2/3 2:59"
  And I see "Всё Для Народа"
  And I see "3/3 4:23"
  Then I press " .. "

  Then I should see text containing "08 The Police"
  When I touch the "08 The Police" text
  Then I should see text containing "The Police - Reggatta de Blanc"
  And I see "Message in a Bottle"
  And I see "1/3 4:50"
  And I see "Reggatta de Blanc"
  And I see "2/3 3:05"
  And I see "It\'s Alright for You"
  And I see "3/3 3:12"
  Then I press " .. "

# FIXME: finish this thing
# DONE

Scenario: Check tabs and About
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

Scenario: Change "Music home folder" to Music
  Then I press "icon"
  Then I press "leftButtonFirst"
  Then I press "Settings"
  Then I press "Music home folder"
  Then I scroll until I see the "Music" text
  Then I press "Music"
  Then I press "Select"
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
  And I should see text containing "07 Кирпичи - Камни"
  And I should see text containing "08 The Police"

# FIXME: We need a scenario: go to Settings, change "Music home folder" to Music, return to tabs and ensure we see LocalMusicTestSuite right in Folders tab
# DONE  

Scenario: Check if Albums tab contain items from LocalMusicTestSuite   
  Then I press "icon"
  Then I press "Albums"
  When I touch the "Californication" text
  Then I see "Around The World"
  And I see "Otherside"
  And I see "Road Trippin\'"
  Then I go back
  When I touch the "Dark Horse" text
  Then I see "Shakin\' Hands"
  And I see "S.E.X."
  Then I go back
  When I touch the "Greatest Hits" text
  Then I see "Rhiannon"
  And I see "Don\'t stop"
  And I see "Go your own way"
  And I see "Hold Me"
  And I see "Everywhere"
  Then I go back
  When I touch the "Night Visions" text
  Then I see "Radioactive"
  Then I go back
  Then I scroll down
  When I touch the "Reggatta de" text
  Then I see "Message in a Bottle"
  And I see "Reggatta de Blanc"
  And I see "It\'s Alright for You"
  Then I go back
  When I touch the "Sgt. Pepper\'s" text
  Then I should see text containing "Sgt. Pepper\'s"
  Then I should see text containing "With a Little Help"
  Then I should see text containing "Lucy in the Sky"
  Then I see "Getting Better"
  Then I see "Fixing a Hole"
  Then I scroll down
  Then I see "She\'s Leaving Home"
  Then I should see text containing "Being for the Benefit"
  Then I see "Within You Without You"
  Then I see "When I\'m Sixty-Four"
  Then I scroll down
  Then I see "Lovely Rita"
  Then I go back
  Then I scroll down
  When I touch the "Speak Now" text
  Then I see "Mine"
  And I see "Sparks Fly"
  And I see "Back To December"
  Then I go back
  When I touch the "Камни" text
  And I see "Летим По Кругу"
  And I see "Вперед - Бодрит"
  And I see "Всё Для Народа"
  Then I go back
  Then I scroll up

Scenario: Check if Artists tab contain items from LocalMusicTestSuite
  Then I press "icon"
  Then I press "Albums"
  Then I press "Artists"
  Then I see "The Beatles"
  And I see "1 album, 10 songs out of 10"
  Then I see "Fleetwood Mac"
  And I see "1 album, 5 songs out of 5"
  Then I see "Imagine Dragons"
  And I see "1 album, 1 song out of 1"
  Then I see "Nickelback"
  And I see "1 album, 2 songs out of 2"
  Then I scroll down
  Then I see "The Police"
  And I see "1 album, 3 songs out of 3"
  Then I see "Red Hot Chili Peppers"
  And I see "1 album, 2 songs out of 3"
  And I see "1 album, 1 song out of 3"
  Then I see "Taylor Swift"
  And I see "1 album, 3 songs out of 3"
  Then I see "Кирпичи"
  And I see "1 album, 3 songs out of 3"
  Then I scroll up

Scenario: Check if Songs tab contain items from LocalMusicTestSuite
  Then I press "icon"
  Then I press "Albums"
  Then I press "Artists"
  When I press "Songs"
  Then I see "Around The World"
  And I see "1/30 3:58"
  Then I see "Back To December"
  And I see "2/30 4:53"
  Then I should see text containing "Being for the Benefit"
  And I see "3/30 2:37"
  Then I see "Don\'t Stop"
  And I see "4/30 3:10"
  Then I see "Everywhere"

  Then I scroll until I see the "9/30 3:42" text
  And I see "5/30 3:42"
  Then I see "Fixing a Hole"
  Then I see "6/30 2:36"
  Then I see "Getting Better"
  Then I see "7/30 2:48"
  Then I see "Go Your Own Way"
  Then I see "8/30 3:38"
  Then I see "Hold Me"
  Then I see "9/30 3:42"

  Then I scroll until I see the "13/30 4:50" text 
  Then I see "It\'s Alright for You" 
  Then I see "10/30 3:12"
  Then I see "Lovely Rita"  
  Then I see "11/30 2:42"
  Then I should see text containing "Lucy in the Sky"  
  Then I see "12/30 3:28"
  Then I see "Message in a Bottle"  
  Then I see "13/30 4:50"

  Then I scroll until I see the "17/30 3:05" text
  Then I see "Mine"  
  Then I see "14/30 3:50"
  Then I see "Otherside"
  Then I see "15/30 4:15"
  Then I see "Radioactive" 
  Then I see "16/30 3:06"
  Then I see "Reggatta de Blanc"
  Then I see "17/30 3:05"

  Then I scroll until I see the "21/30 2:02" text
  Then I see "Rhiannon" 
  Then I see "18/30 4:12"
  Then I see "Road Trippin\'"
  Then I see "19/30 3:25"
  Then I see "S.E.X."
  Then I see "20/30 3:53"
  Then I should see text containing "Sgt. Pepper\'s" 
  Then I see "21/30 2:02"

  Then I scroll until I see the "25/30 2:37" text 
  Then I see "Shakin\' Hands"  
  Then I see "22/30 3:39"
  Then I see "She\'s Leaving Home"  
  Then I see "23/30 3:35"
  Then I see "Sparks Fly"  
  Then I see "24/30 4:20"
  Then I see "When I\'m Sixty-Four"
  Then I see "25/30 2:37"

  Then I scroll until I see the "29/30 4:23" text 
  Then I see "With a Little Help"  
  Then I see "26/30 2:44"
  Then I see "Within You Without You" 
  Then I see "27/30 5:04"
  Then I see "Вперед - Бодрит" 
  Then I see "28/30 2:59"
  Then I see "Всё Для Народа"  
  Then I see "29/30 4:23"
  Then I scroll down
  Then I see "Летим По Кругу"
  Then I see "30/30 3:19"
  Then I scroll up

# FIXME: Also we have to check if Albums, Artists and Songs tabs contain items from LocalMusicTestSuite
# DONE

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
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"
  When I touch the "00 Fleetwood Mac" text
  Then I press "Rhiannon"
  Then I press "slide_panel_now_playing_title"
  Then I should see text containing "Rhiannon - Greatest Hits"
  Then I see "Fleetwood Mac"
  And I see "4:12"
  And I see "1/5"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing
  Then I go back
  Then I go back

Scenario: Play/Pause Music - long press (Folders tab)
  Then I press "icon"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"
  When I touch the "01 Imagine Dragons" text
  Then I long press "Radioactive"
  Then I press "Play"
  Then I press "slide_panel_now_playing_title"
  Then I should see text containing "Radioactive - Night Visions"
  Then I see "Imagine Dragons"
  And I see "3:06"
  And I see "1/1"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing
  Then I go back
  Then I go back


# FIXME: use music from LocalMusicTestSuite folder, and use track titles as identifiers instead of numbers
# DONE
# FIXME: ensure track is set successfully to player by verifying track's title, album, total time and number in folder (1/5)
# DONE
# FIXME: ensure playback is started by waiting for some time and checking that current time is not zero
# DONE
# FIXME: ensure playback is paused by waiting for some time and checking that current time didn't change (is it possible?)
# DONE
# FIXME: Ensure play track is working from all tabs, including long press menu
# DONE

Scenario: Play/Pause Music (Playlists tab)
  Then I press "icon"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"
  When I touch the "00 Fleetwood Mac" text
  Then I long press "Rhiannon"
  Then I press "Add to playlist"
  Then I press "New"
  Then I press "Save"
  Then I go back
  Then I press "Playlists"
  Then I press "Rhiannon"
  Then I touch the "Fleetwood Mac" text
  When I press "slide_panel_now_playing_title"
  Then I see "4:12"
  And I see "1/1"
  And I should see text containing "Rhiannon - Greatest Hits"
  And I see "Fleetwood Mac"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing
  Then I go back
  Then I wait for 2 second
  Then I go back
  Then I long press "Rhiannon"
  Then I press "Delete"

Scenario: Play/Pause Music - long press (Playlists tab)
  Then I press "icon"
  Then I press "Playlists"
  Then I press "Folders"
  When I touch the "00 Fleetwood Mac" text
  Then I long press "Don\'t Stop"
  Then I press "Add to playlist"
  Then I press "New"
  Then I press "Save"
  Then I go back
  Then I press "Playlists"
  Then I long press "Don\'t Stop"
  Then I press "Play"
  When I press "slide_panel_now_playing_title"
  Then I see "3:10"
  And I see "1/1"
  And I should see text containing "Don\'t Stop - Greatest Hits"
  And I see "Fleetwood Mac"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing
  Then I go back
  Then I long press "Don\'t Stop"
  Then I press "Delete"

Scenario: Play/Pause Music (Albums tab)
  Then I press "icon"
  Then I press "Playlists"
  Then I press "Albums"
  Then I scroll up
  Then I press "Dark Horse"
  Then I press "Shakin\' Hands"
  When I press "slide_panel_now_playing_title"
  Then I see "Nickelback"
  And I should see text containing "Shakin\' Hands - Dark"
  And I see "3:39"
  And I see "1/2"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing
  Then I go back
  Then I go back

Scenario: Play/Pause Music - long press (Albums tab)
  Then I press "icon"
  Then I press "Playlists"
  Then I press "Albums"
  Then I press "Dark Horse"
  Then I long press "S.E.X."
  Then I press "Play"
  When I press "slide_panel_now_playing_title"
  Then I see "Nickelback"
  And I should see text containing "S.E.X. - Dark Horse"
  And I see "3:53"
  And I see "2/2"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing
  
Scenario: Play/Pause Music (Artists tab)
  Then I press "icon"
  Then I press "Playlists"
  Then I press "Artists"
  Then I press "The Beatles"
  Then I touch the "Sgt. Pepper\'s" text
  Then I press "Getting Better"
  When I press "slide_panel_now_playing_title"
  Then I see "The Beatles"
  And I should see text containing "Getting Better - Sgt."
  And I see "2:48"
  And I see "4/10"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing

Scenario: Play/Pause Music - long press (Artists tab)
  Then I press "icon"
  Then I press "Playlists"
  Then I press "Artists"
  Then I press "The Beatles"
  Then I touch the "Sgt. Pepper\'s" text
  Then I long press "Fixing a Hole"
  Then I press "Play"
  When I press "slide_panel_now_playing_title"
  Then I see "The Beatles"
  And I should see text containing "Fixing a Hole - Sgt."
  And I see "2:36"
  And I see "5/10"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing

Scenario: Play/Pause Music (Songs tab)
  Then I press "icon"
  Then I press "Playlists"
  Then I press "Artists"
  Then I press "Songs"
  Then I press "Around The World"
  When I press "slide_panel_now_playing_title"
  Then I see "Red Hot Chili Peppers"
  And I should see text containing "Around The World"
  And I see "3:58"
  And I see "1/30"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing

Scenario: Play/Pause Music - long press (Songs tab)
  Then I press "icon"
  Then I press "Playlists"
  Then I press "Artists"
  Then I press "Songs"
  Then I long press "Back To December"
  Then I press "Play"
  When I press "slide_panel_now_playing_title"
  Then I see "Taylor Swift"
  And I should see text containing "Back To December"
  And I see "4:53"
  And I see "2/30"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing
  
Scenario: Switching between tracks
  Then I press "icon"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"
  When I touch the "00 Fleetwood Mac" text
  Then I press "Don\'t Stop"
  Then I press "slide_panel_now_playing_title"
  Then I see "2/5"
  When I press "next_control"
  Then I see "3/5"
  When I press "next_control"
  Then I see "4/5"
  When I press "prev_control"
  Then I see "3/5"
  When I press "prev_control"
  Then I see "2/5"
  # When I swipe right
  # Then I see "3/5"
  # When I swipe right
  # Then I see "4/5"

# FIXME: Check if track switching is working by next/prev buttons and cover right/left slides
# DONE 50% (Need test for swipe right/left)

# !!! FIXME: Ensure that by tap on cover current folder opens - check folder title and existence of some tracks (can't tap on cover need investigate)


# FIXME: Use LocalMusicTestSuite instead of Music, and after creating playlist, ensure that there are songs from LocalMusicTestSuite in that playlist
# DONE

Scenario: Long press actions - Add/Rename/Delete (Playlists tab)
  Then I press "icon"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"
  Then I long press "5 songs"
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
  Then I go back
  Then I press "Save"
  Then I press "Playlists"
  And I should see text containing "Fleetwood Mac"
  Then I press "Fleetwood Mac"
  And I see "Rhiannon"
  And I see "Don\'t Stop"
  And I see "Go Your Own Way"
  And I see "Hold Me"
  And I see "Everywhere"
  Then I go back
  Then I long press "Fleetwood Mac"
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
  Then I long press "Custome"
  Then I press "Delete"
  And I don't see "Custome"

Scenario: Long press actions - Play From the ... (Playlists tab)
  Then I press "icon"
  Then I press "Albums"
  Then I press "Playlists"
  Then I press "Folders"
  Then I long press "5 songs"
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "Fleetwood Mac" into field with id "playlist"
  Then I go back
  Then I press "Save"
  Then I press "Playlists"
  Then I long press "Fleetwood Mac"
  Then I press "Play from the beginning"
  Then I press "slide_panel_now_playing_title"
  And I should see text containing "Rhiannon - Greatest Hits"
  And I see "4:12"
  And I see "1/5"
  Then I check Music playing
  Then I press "pause"
  Then I check Music pause
  Then I press "pause"
  Then I check Music playing
  Then I press "next_control"
  Then I press "next_control"
  And I see "3/5"
  Then I go back
  Then I wait for 2 seconds
  Then I go back
  Then I press "Albums"
  Then I long press "Californication"
  Then I press "Play"
  Then I press "Playlists"
  Then I long press "Fleetwood Mac"
  When I press "Play from the saved position"
  Then I press "slide_panel_now_playing_title"
  And I should see text containing "Go Your Own Way"
  And I see "3/5"
  And I see "3:38"
  Then I go back
  Then I wait for 2 seconds
  Then I go back

# FIXME: Ensure others items from long press menu are covered too - Play, Add to playlist, Play from beginning, Play from the saved position
# DONE

# FIXME: ensure created playlist contains appropriate tracks
# DONE
Scenario: Long press actions - Add/Delete playlist from Albums tab
  Then I press "icon"
  Then I press "Albums"
  Then I long press "Dark Horse"
  Then I press "Add to playlist"
  Then I press "New"
  Then I clear "playlist"
  Then I enter text "From_Albums" into field with id "playlist"
  Then I go back
  Then I press "Save"
  Then I press "Playlists"
  And I see "From_Albums"
  When I press "From_Albums"
  Then I see "Shakin\' Hands"
  And I see "1/2 3:39"
  And I see "S.E.X."
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
  Then I long press "Imagine Dragons"
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
  Then I see "Radioactive"
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
  Then I long press "Back To December"
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
  And I see "Back To December"
  And I see "1/1 4:53"
  Then I go back
  Then I long press "From_Songs"
  Then I press "Delete"
  Then I don't see "From_Songs"

Scenario: Songs tab (View component)
  Then I press "icon"
  Then I press "Artists"
  Then I press "Songs"
  Then I long press list item number 1
  Then I see "Play"
  Then I see "Add to playlist"
  Then I see "Jump to Album"
  Then I see "Jump to Artist"
  Then I see "Jump to Folder"
  Then I see "Update cover art"  

Scenario: Long press actions - Jum to .. (Songs tab)
  Then I press "icon"
  Then I press "Artists"
  Then I press "Songs"
  Then I long press "Around The World"
  Then I press "Jump to Album"
  Then I wait for 3 seconds
  And I see "Californication"
  And I see "Around The World"
  And I see "Otherside"
  And I see "Road Trippin\'"
  Then I go back
  Then I press "Songs"
  Then I long press "Back To December"
  Then I press "Jump to Artist"
  Then I wait for 3 seconds
  And I see "Taylor Swift"
  And I should see text containing "Speak Now"
  Then I press "Songs"
  Then I long press "Don\'t Stop"
  Then I press "Jump to Folder"
  Then I wait for 3 seconds
  Then I see "Rhiannon"
  And I see "Don\'t Stop"
  And I see "Go Your Own Way"
  And I see "Hold Me"
  Then I scroll until I see the "Everywhere" text
# FIXME: use track names instead of numbers
# DONE

Scenario: Long press actions - Jum to Folder (Albums tab)
  Then I press "icon"
  Then I press "Albums"
  Then I press "Dark Horse"
  Then I long press "S.E.X."
  Then I press "Jump to Folder"
  Then I wait for 3 seconds
  And I see "Shakin\' Hands"
  And I see "1/2 3:39"
  And I see "S.E.X."
  And I see "2/2 3:53"
  And I press " . . "

Scenario: Long press actions - Jum to Folder (Artists tab)
  Then I press "icon"
  Then I press "Albums"
  Then I press "Artists"
  Then I press "The Police"
  Then I press "Reggatta de Blanc"
  Then I long press "Message in a Bottle"
  Then I press "Jump to Folder"
  Then I wait for 3 seconds
  And I see "Message in a Bottle"
  And I see "1/3 4:50"
  And I see "Reggatta de Blanc"
  And I see "2/3 3:05"
  And I see "It\'s Alright for You"
  And I see "3/3 3:12"
  And I press " . . "

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
