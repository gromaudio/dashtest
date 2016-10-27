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
    Then I press permission "Permit drawing over other apps"
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
    Then I wait for 1 second
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

# EXIT

Scenario: Exit check
    Then I press "leftButtonFirst"
    Then I press "Exit"
    Then I don't see "Exit"

# MAIN

Scenario: Check default plugin tabs
    Then I drag from 75:50 to 35:50 moving with 5 steps
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
    Then I drag from 25:50 to 75:50 moving with 5 steps
    Then I drag from 25:50 to 75:50 moving with 5 steps
    Then I press "leftButtonFirst"
    Then I swipe to left

Scenario: Add App
    Then I drag from 75:50 to 35:50 moving with 5 steps
    Then I press "icon"
    Then I scroll to "Play Store" text
    Then I press "Play Store"
    And I see "Play Store"
    Then I wait for 2 seconds
    Then I press "menu_button"
    And I press "delete"
    Then I swipe to left

#Scenario: Launch and Check App
#    Then I drag from 75:50 to 35:50 moving with 5 steps 
#    When I press "icon"
#    Then I press item with name "*****"
#    Then I click back button
#    Then I wait for 2 seconds
#    Then I press "menu_button"
#    And I press "delete"
#    Then I swipe to left

Scenario: Add Shourtcat    
    Then I drag from 75:50 to 35:50 moving with 5 steps
    Then I press "icon"
    When I press "SHORTCUTS"
    Then I scroll until I see the "AM Radio" text
    Then I press "AM Radio"
    And I see "AM Radio"
    Then I swipe to left
    Then I drag from 75:50 to 35:50 moving with 5 steps
    And I see "AM Radio"
    Then I swipe to left

Scenario: Launch and Check Shourtcat 
    Then I drag from 75:50 to 35:50 moving with 5 steps   
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
    Then I drag from 75:50 to 35:50 moving with 5 steps
    Then I press "icon"
    Then I press "PLUGINS"
    Then I press "Local Music"
    Then I see "Local Music"
    Then I swipe to left
    Then I drag from 75:50 to 35:50 moving with 5 steps
    And I see "Local Music"
    Then I swipe to left 

Scenario: Launch and Check Plugin 
    Then I swipe to next board
    When I press "icon"
    And I see "Folders"
    And I see "Playlists"
    And I see "Albums"
    Then I press "leftButtonFirst"
    When I press "Settings"
    Then I see "Local Settings"
    Then I go back
    Then I wait for 2 seconds
    Then I press "leftButtonFirst"
    Then I press "Exit"
    Then I press "menu_button"
    Then I press "delete"       
    Then I swipe to left  

Scenario: Delete plugin
    Then I swipe to next board
    Then I press "icon"
    Then I press "PLUGINS"
    Then I press "Spotify"
    Then I see "Spotify"
    Then I press "menu_button"
    Then I press "delete"
    Then I don't see "Spotify"
    Then I swipe to left

Scenario: Replace plugin
    Then I swipe to next board
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
    Then I drag from 75:50 to 35:50 moving with 5 steps
    And I see "GMusic"
    Then I press "menu_button"
    Then I press "delete"
    Then I swipe to left

Scenario: Add multiple plugins
    Then I drag from 75:50 to 35:50 moving with 5 steps
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
    Then I drag from 75:50 to 35:50 moving with 5 steps
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

Scenario: Player restore
    Then I swipe to left
    Then I swipe to left
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
    Then I wait for 2 seconds
    Then I swipe to down
    And I see "00 Mine"
    And I see "04 Taylor Swift"
    Then I press "play_button_additional"
    Then I wait for 3 seconds
    Then I check player playing
    
    Then I restart application
    Then I wait for 2 seconds
    Then I swipe to down
    And I see "00 Mine"
    And I see "04 Taylor Swift"
    Then I press "play_button_additional"
    Then I wait for 3 seconds
    Then I check player playing
    
    Then I restart application
    Then I wait for 2 seconds
    Then I swipe to down
    And I see "00 Mine"
    And I see "04 Taylor Swift"
    Then I press "play_button_additional"
    Then I wait for 3 seconds
    Then I check player playing

    Then I restart application
    Then I wait for 2 seconds
    Then I swipe to down
    And I see "00 Mine"
    And I see "04 Taylor Swift"
    Then I press "play_button_additional"
    Then I wait for 3 seconds
    Then I check player playing

    Then I restart application
    Then I wait for 2 seconds
    Then I swipe to down
    And I see "00 Mine"
    And I see "04 Taylor Swift"
    Then I press "play_button_additional"
    Then I wait for 3 seconds
    Then I check player playing

    Then I restart application
    Then I wait for 2 seconds
    Then I swipe to down
    And I see "00 Mine"
    And I see "04 Taylor Swift"
    Then I press "play_button_additional"
    Then I wait for 3 seconds
    Then I check player playing

    Then I restart application
    Then I wait for 2 seconds
    Then I swipe to down
    And I see "00 Mine"
    And I see "04 Taylor Swift"
    Then I press "play_button_additional"
    Then I wait for 3 seconds
    Then I check player playing

    Then I restart application
    Then I wait for 2 seconds
    Then I swipe to down
    And I see "00 Mine"
    And I see "04 Taylor Swift"
    Then I press "play_button_additional"
    Then I wait for 3 seconds
    Then I check player playing

    Then I restart application
    Then I wait for 2 seconds
    Then I swipe to down
    And I see "00 Mine"
    And I see "04 Taylor Swift"
    Then I press "play_button_additional"
    Then I wait for 3 seconds
    Then I check player playing

    Then I restart application
    Then I wait for 2 seconds
    Then I swipe to down
    And I see "00 Mine"
    And I see "04 Taylor Swift"
    Then I press "play_button_additional"
    Then I wait for 3 seconds
    Then I check player playing        


    # FIXME: can we check if Sticky icon changed?
    # Don't know how to implement for now

    # FIXME: can we check that pressed check boxes are checked/unchecked?
    # Don't know how to implement for now