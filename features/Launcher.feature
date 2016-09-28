Feature: Launcher
@debug 
Scenario: Start
    Then I press "skipButton"
    Then I press "button2"
    Then I press "weather_icon"
    Then I press "updateIndicator"
       
# SIDE MENU

Scenario: View Side Menu
    Then I press "leftButtonFirst"
    Then I see "Settings"
    Then I see "About"
    Then I see "Exit"

# SETTINGS

Scenario: View Settings
    Then I press "leftButtonFirst"
    Then I press "Settings"
    Then I see "Units"
    And I see "Speed"
    And I see "Temperature"
    Then I see "Startup"
    And I see "Bluetooth connection"
    And I see "Bluetooth connections that will launch DashLinQ automatically"
    Then I see "Advanced functionality"
    And I see "Display Stay Awake"
    Then I scroll down
    And I see "Show Quick Return icon"
    And I see "When other app is active the quick return icon will be shown at the side of the app. Icon can be adjusted in location via finger press and drag action."
    Then I scroll down
    Then I see "Speech To Text Engine"
    Then I press "Speech To Text Engine"
    And I see "Google"
    Then I go back
    Then I scroll down
    Then I see "Advertising"
    Then I see "Car Integration"
    And I see "Disable USB Streaming"
    And I see "Disable USB when phone behaves incorrect or lagging"
    And I see "Find compatible device"
    And I see "Find the best GROM module for your vehicle. Direct integration and digital quality sound."

Scenario: View Settings components 
    Then I press "leftButtonFirst"
    Then I press "Settings"

    Then I see "MPH"
    Then I press "Speed"
    Then I see "KM/H"
    Then I press "Speed"
    Then I see "MPH"

    Then I see "℉"
    Then I press "Temperature"
    Then I see "℃"
    Then I press "Temperature"
    Then I see "℉"

    Then I press "Bluetooth connection"
    Then I see "Bluetooth connection"
    Then I press "Cancel"

    Then I press "Display Stay Awake"
    Then I press "Display Stay Awake"

    Then I scroll down
    Then I press "Show Quick Return icon"
    Then I press "Show Quick Return icon"

    Then I press "Sticky icon"
    Then I see "None"
    Then I see "Rotation lock" 
    Then I see "Brightness"
    Then I press "None"

    Then I press "Navigation"
    Then I see "Maps"
    Then I press "Maps"

    Then I press "Speech To Text Engine"
    Then I see "Google"
    Then I press "Google"

    Then I scroll down
    Then I press "Disable USB Streaming"
    Then I press "Disable USB Streaming"

Scenario: Settings (Brightness)
    Then I press "leftButtonFirst"
    Then I press "Settings"
    Then I scroll down
    Then I press "Sticky icon"
    Then I press "Brightness"
    Then I press "leftButtonFirst"
    Then I press "leftButtonSecond"
    Then I press "leftButtonSecond"
    Then I press "leftButtonSecond"
    Then I press "leftButtonSecond"

Scenario: Settings (Brightness) after restart 
    Then I wait for 2 seconds
    Then I press "leftButtonSecond"
    Then I press "leftButtonSecond"    

Scenario: Settings (Rotation lock)
    Then I press "leftButtonFirst"
    Then I press "Settings"
    Then I scroll down
    Then I press "Sticky icon"
    Then I press "Rotation lock"
    Then I press "leftButtonFirst"
    Then I press "leftButtonSecond"
    Then I press "leftButtonSecond"
    
Scenario: Settings (Rotation lock) after restart
    Then I wait for 2 seconds
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

Scenario: Settings (Speed & Temperature) after restart
    Then I wait for 2 seconds
    Then I press "weather_icon"
    Then I see "℃"
    Then I see "kmph"

Scenario: Find compatible device
    Then I press "leftButtonFirst"
    Then I press "Settings"
    Then I scroll down
    Then I scroll down
    Then I press "Find compatible device"
    Then I see "DashLinQ is a media player for car use. Gestures, large fonts and simple layout is perfect while driving. For seemless car integration use GROM module for your specific car."
    Then I see "Choose your make/year for further instructions:"
    Then I see "If you are GROM customer press Skip and enjoy"
    Then I see "Select Car Make"
    Then I see "Select Year"
    Then I see "Select Model"
    Then I see "Skip"
    Then I see "Find Interface"

# ABOUT

Scenario: View About section
    Then I press "leftButtonFirst"
    Then I press "About"
    Then I press "More options"
    And I see "Send Report Error"
    And I see "Send Feedback"

#Scenario: About check (Send Report Error)
#    Then I press "leftButtonFirst"
#    Then I press "About"
#    Then I press "More options"
#    Then I press "Send Report Error"
#    Then I wait for 2 seconds
#    Then I go back
#    Then I press item with name "Select an application to send the log"

#Scenario: About check (Send Feedback)
#    Then I press "leftButtonFirst"
#    Then I press "About"
#    Then I press "More options"
#    Then I press "Send Feedback"
#    Then I wait for 2 seconds
#    Then I go back
#    Then I press item with name "Send Feedback Email"

# EXIT

Scenario: Exit check
    Then I press "leftButtonFirst"
    Then I press "Exit"
    Then I don't see "Exit"

# MAIN

Scenario: Check default plugin tabs
    Then I swipe right
    Then I press "icon"
    Then I see "APPS"
    Then I see "SHORTCUTS"
    Then I see "PLUGINS"
    Then I press "SHORTCUTS"
    Then I press "PLUGINS"
    Then I see "GMusic"
    Then I see "Local Music"
    Then I see "Spotify"
    Then I scroll down
    Then I see "WebRadio"
    Then I see "Where is My Car"
    Then I swipe to left
    Then I swipe to left
    Then I press "leftButtonFirst"
    Then I swipe to left

Scenario: Swipe-down player menu
    Then I swipe to down
    Then I press "next_button"
    Then I press "prev_button"
    Then I press "play_button_additional"
    Then I go back

Scenario: Swipe-up location menu
    Then I swipe to up
    Then I press "locationTextView"
    Then I go back

Scenario: Add App
    Then I swipe right
    Then I press "icon"
    Then I scroll to "Play Store" text
    Then I press "Play Store"
    And I see "Play Store"
    Then I wait for 2 seconds
    Then I press "menu_button"
    And I press "delete"
    Then I swipe to left

Scenario: Add Shourtcat    
    Then I swipe right
    Then I press "icon"
    When I press "SHORTCUTS"
    Then I scroll until I see the "AM Radio" text
    Then I press "AM Radio"
    And I see "AM Radio"
    Then I swipe to left
    Then I swipe right
    And I see "AM Radio"
    Then I swipe to left

Scenario: Launch and Check Shourtcat 
    Then I swipe right   
    When I press "icon"
    And I see "Stations"
    And I see "Favorites"
    And I see "Records"
    Then I press "leftButtonFirst"
    When I press "Settings"
    Then I see "AM Settings"
    Then I go back
    Then I press "leftButtonFirst"
    Then I press "Exit"
    Then I press "menu_button"
    Then I press "delete"
    Then I swipe to left  

Scenario: Add Plugin
    Then I swipe right
    Then I press "icon"
    Then I press "PLUGINS"
    Then I press "Local Music"
    Then I see "Local Music"
    Then I swipe to left
    Then I swipe right
    And I see "Local Music"
    Then I swipe to left 
   
Scenario: Launch and Check Plugin 
    Then I swipe right   
    When I press "icon"
    And I see "Folders"
    And I see "Playlists"
    And I see "Albums"
    Then I press "leftButtonFirst"
    When I press "Settings"
    Then I see "Local Settings"
    Then I go back
    Then I press "leftButtonFirst"
    Then I press "Exit"
    Then I press "menu_button"
    Then I press "delete"       
    Then I swipe to left  

Scenario: Delete plugin
    Then I swipe right
    Then I press "icon"
    Then I press "PLUGINS"
    Then I press "Spotify"
    Then I see "Spotify"
    Then I press "menu_button"
    Then I press "delete"
    Then I don't see "Spotify"
    Then I swipe to left

Scenario: Replace plugin
    Then I swipe right
    Then I press "icon"
    Then I press "PLUGINS"
    Then I press "Spotify"
    Then I see "Spotify"
    Then I press "menu_button"
    Then I press "replace"
    Then I press "PLUGINS"
    Then I press "GMusic"
    Then I see "GMusic"
    Then I swipe to left
    Then I swipe right
    And I see "GMusic"
    Then I press "menu_button"
    Then I press "delete"
    Then I swipe to left

Scenario: Add multiple plugins
    Then I swipe right
    Then I press "icon"
    Then I press "PLUGINS"
    Then I press "Local Music"
    Then I press "icon"
    Then I press "PLUGINS"
    Then I scroll down
    Then I press "Where is My Car"
    Then I see "Local Music"
    Then I see "Where is My Car"
    Then I swipe to left
    Then I swipe right
    And I see "Local Music" 
    And I see "Where is My Car"
    Then I swipe to left

# VOICE WIDGET

Scenario: View Widget
    Then I press "voice_search"
    Then I see "Voice Commands"
    Then I see "Call"
    Then I see "Navigate"

Scenario: Voice Widget (Call)
    Then I press "voice_search"
    Then I see "Voice Commands"
    Then I press "Call"

Scenario: Voice Widget (Navigate)
    Then I press "voice_search"
    Then I see "Voice Commands"
    Then I press "Navigate"

# NAVIGATION WIDGET

Scenario: Navigation widget
    Then I press "navi_icon"

# WEATHER WIDGET

Scenario: View Time&Weather plugin
    Then I wait for 2 seconds
    Then I check weather widget time
    Then I press "weather_icon"
    Then I see "DAY"
    Then I see "EVENING"
    Then I see "NIGHT"
    Then I see "MORNING"

@debug
Scenario: Player restore
    Then I press "icon"
    Then I wait for 2 seconds
    Then I press "leftButtonFirst"
    Then I press "Settings"
    Then I wait for 2 seconds
    Then I scroll down
    Then I press "Music home folder"
    Then I scroll to "Music" text
    Then I press "Music"
    Then I press "00 LocalMusicTestSuite"
    Then I press "Select"
    Then I press "Media Rescan"
    Then I press "leftButtonFirst"
    Then I press "Albums"
    Then I press "Artists"
    Then I press "Songs"
    Then I press "00 Mine"
    Then I press "Artists"
    Then I press "Albums"
    Then I press "Playlists"
    Then I press "Folders"
    Then I press "leftButtonFirst"
    Then I press "Exit"
        
    Then I restart application
    Then I wait for 1 second
    Then I swipe to down
    And I see "00 Mine"
    And I see "04 Taylor Swift"
    Then I press "play_button_additional"
    Then I wait for 3 seconds
    Then I check player playing
    
    Then I restart application
    Then I wait for 1 second
    Then I swipe to down
    And I see "00 Mine"
    And I see "04 Taylor Swift"
    Then I press "play_button_additional"
    Then I wait for 3 seconds
    Then I check player playing
    
    Then I restart application
    Then I wait for 1 second
    Then I swipe to down
    And I see "00 Mine"
    And I see "04 Taylor Swift"
    Then I press "play_button_additional"
    Then I wait for 3 seconds
    Then I check player playing

    Then I restart application
    Then I wait for 1 second
    Then I swipe to down
    And I see "00 Mine"
    And I see "04 Taylor Swift"
    Then I press "play_button_additional"
    Then I wait for 3 seconds
    Then I check player playing

    Then I restart application
    Then I wait for 1 second
    Then I swipe to down
    And I see "00 Mine"
    And I see "04 Taylor Swift"
    Then I press "play_button_additional"
    Then I wait for 3 seconds
    Then I check player playing

    Then I restart application
    Then I wait for 1 second
    Then I swipe to down
    And I see "00 Mine"
    And I see "04 Taylor Swift"
    Then I press "play_button_additional"
    Then I wait for 3 seconds
    Then I check player playing

    Then I restart application
    Then I wait for 1 second
    Then I swipe to down
    And I see "00 Mine"
    And I see "04 Taylor Swift"
    Then I press "play_button_additional"
    Then I wait for 3 seconds
    Then I check player playing

    Then I restart application
    Then I wait for 1 second
    Then I swipe to down
    And I see "00 Mine"
    And I see "04 Taylor Swift"
    Then I press "play_button_additional"
    Then I wait for 3 seconds
    Then I check player playing

    Then I restart application
    Then I wait for 1 second
    Then I swipe to down
    And I see "00 Mine"
    And I see "04 Taylor Swift"
    Then I press "play_button_additional"
    Then I wait for 3 seconds
    Then I check player playing

    Then I restart application
    Then I wait for 1 second
    Then I swipe to down
    And I see "00 Mine"
    And I see "04 Taylor Swift"
    Then I press "play_button_additional"
    Then I wait for 3 seconds
    Then I check player playing        


    # FIXME: Swipe left doesn't work on my Nexus 5 & Samsung A300 - it swipes in correct direction, but releases too early, so screen doesn't change
    # DONE

    # FIXME: ensure we see current time on the widget on the main screen
    # DONE

    # FIXME: ensure app is launched
    # - don't know how to implement for now

    # FIXME: we will implement auto testing for voice playback when we have time, for now - only manual testing
    
    # FIXME: we need a scenario to check if changed settings are correctly saved and restored after app restart including units, sticky icon etc
    # DONE

    # NOTE: all item from PLUGINS tab are called PLUGINS (Local, Webradio etc), fixed three items from launcher screen are called widgets - Voice, Weather, Navigation

    # FIXME: can we check if Sticky icon changed?
    # Don't know how to implement for now

    # NOTE: Device may already have bluetooth connections, so we can only test dialog header

    # FIXME: we should have manual test for testing this dialog: 1)device has no connected BT devices 2) this dialog shows "To enable Bluetooth integration please enable Bluetooth in Settings" 3) press "enable" button 4) pair some device 5) ensure this dialog shows that device
    # Added manual tests

    # FIXME: please think about how can we test advertising option?
    # Don't know how to implement for now

    # FIXME: can we check if Sticky icon changed?
    # Don't know how to implement for now

    # FIXME: can we check that pressed check boxes are checked/unchecked?
    # Don't know how to implement for now

    # NOTE: if you press something, make sure you unpress it and check that it returned back

    # FIXME: how we can check A2DP Stream & Car Play plugins existence in VLine mode?
    # It's not possible without BLoutooth adapter box (USB Car Kits)

    # FIXME: ensure we have following scenarios:
    # - add apps, shortcuts, plugins to the slots of all three screens and ensure the are added successfully
    # - done
    # - swipe screens left-right and ensure added icons are there where they were added
    # - done
    # - replace one item with another via item menu
    # - done
    # - delete item via item menu
    # - done
    # - check that swipe-down player menu is working
    # - done
    # - check that swipe-up location menu is working
    # - done

    # - launching item - we should ensure that apps, shortcuts and plugins launch as expected:
     #   - app can be checked by launching an app which 100% have all the devices - calculator for example
     #   - don't know how to implement for now

    #   - shortcut can be checked by AM/FM shortcuts
    #   - plugins can be checked by launching Local music for example
    # - done
    
    # - swap items via drag&drop, including dragging over to next screen
    # - don't know how to implement for now
    