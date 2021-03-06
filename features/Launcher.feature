Feature: Launcher

Scenario: Start
    Then I press "closeButton"
    Then I press "button2"
    Then I press "weather_icon"
    Then I press "updateIndicator"
       
# SIDE MENU

Scenario: View Side Menu
    Then I press "leftButtonFirst"
    Then I see "Rate Us!"
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
    And I see "Show Quick Return icon"
    And I see "When other app is active the quick return icon will be shown at the side of the app. Icon can be adjusted in location via finger press and drag action."
    Then I scroll to text "Messages"
    Then I see "Advertising"
    Then I see "Car Integration"
    And I see "Disable USB Streaming"
    And I see "Disable USB when phone plays through speaker instead of stereo speakers"
    And I see "Find compatible device"
    And I see "Find the best GROM module for your vehicle. Direct integration and digital quality sound."
    Then I full scroll down
    Then I see "Messages"
    Then I see "Enable Messages read aloud"
    Then I see "Messages received will be read aloud and you can reply to it by using steering wheel controls or screen buttons and gestures."
    Then I see "Notification access"
    Then I see "To enable reading and replying to messages by Dashlinq app, you need to allow access on next screen or use Settings -> Notification Access -> Dashlinq"
    Then I see "More options"
    

Scenario: View More options Settings (Messaging components)
    Then I press "leftButtonFirst"
    Then I press "Settings"
    Then I scroll to text "More options"
    Then I press "More options"
    Then I see "Messages"
    And I see "Active only when connected"
    And I see "Messages read aloud will be activated only"
    And I see "when connected to GROM or Bluetooth."
    And I see "Supported apps"
    And I see "Select apps that you will want to get messages"
    And I see "from while using DashLinQ"
    Then I press "Supported apps"
    Then I see "Supported apps"
    Then I see "SMS"
    Then I see "Facebook messenger"
    Then I see "Telegram"
    Then I see "WhatsApp"
    Then I see "Slack"
    Then I see "CANCEL"
    Then I see "OK"
    Then I press "OK"
    And I see "Reply options"
    And I see "Select preferred reply options"
    Then I press "Reply options"
    Then I see "Speech-To-Text"
    Then I see "Callback"
    Then I see "Predefined text"
    Then I see "CANCEL"
    Then I see "OK"
    Then I press "OK"    
    Then I see "Predefined text"
    Then I press "Predefined text"
    Then I see "Predefined text"
    And I see "I\'m driving now, will reply when I have a chance"
    Then I see "CANCEL"
    Then I see "OK"
    Then I press "OK"
    Then I press "More options"

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
    Then I press "Show Quick Return icon"
    #Then I press permission "Permit drawing over other apps"
    Then I press "Show Quick Return icon"
    Then I see "Maps"
    Then I full scroll down
    Then I press "Disable USB Streaming"
    Then I press "Disable USB Streaming"

#Scenario: Settings (Brightness)
    #Then I press "leftButtonFirst"
    #Then I press "Settings"
    #Then I scroll to text "Messages"
    #Then I press "Sticky icon"
    #Then I press "Brightness"
    #Then I press "leftButtonFirst"
    #Then I press "leftButtonSecond"
    #Then I press "leftButtonSecond"
    #Then I press "leftButtonSecond"
    #Then I press "leftButtonSecond"

#Scenario: Settings (Brightness) after restart 
    #Then I wait for 2 seconds
    #Then I press "leftButtonSecond"
    #Then I press "leftButtonSecond"    

#Scenario: Settings (Rotation lock)
    #Then I press "leftButtonFirst"
    #Then I press "Settings"
    #Then I scroll to text "Messages"
    #Then I press "Sticky icon"
    #Then I press "Rotation lock"
    #Then I press "leftButtonFirst"
    #Then I press "leftButtonSecond"
    #Then I press "leftButtonSecond"
  
#Scenario: Settings (Rotation lock) after restart
    #Then I wait for 2 seconds
    #Then I press "leftButtonSecond"
    #Then I press "leftButtonSecond"        

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
    Then I scroll to text "Find compatible device"
    Then I press "Find compatible device"
    Then I see "www.gromaudio.com"
    Then I see "learn more"
    Then I see "for cars 2011 and up"
    Then I see "seamless integration"
    Then I press "closeButton"

# Rate Us

#Scenario: View Rate Us
    #Then I press "leftButtonFirst"
    #Then I press "Rate Us"
    #Then I wait
    #And I see "GROM Audio"
    #Then I scroll to text "Only the developer can see this feedback."
    #And I see "Enter feedback about the app"
    #And I see "Share"

# ABOUT

Scenario: View About section
    Then I press "leftButtonFirst"
    Then I press "About"
    Then I wait
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
    Then I see "WebRadio"
    Then I see "Where is My Car"
    Then I drag from 25:50 to 75:50 moving with 5 steps
    Then I drag from 25:50 to 75:50 moving with 5 steps
    Then I press "leftButtonFirst"
    Then I swipe to left

Scenario: Add App
    Then I drag from 75:50 to 35:50 moving with 5 steps
    Then I press "icon"
    Then I press "APPS"
    Then I scroll to text "Play Store"
    Then I press "Play Store"
    And I see "Play Store"
    Then I wait for 2 seconds
    Then I press "menu_button"
    And I press "delete"
    Then I swipe to left

Scenario: Add Shourtcat    
    Then I drag from 75:50 to 35:50 moving with 5 steps
    Then I press "icon"
    When I press "PLUGINS"
    #Then I use_new_scroll until I see the "AM Radio" text
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
    Then I press "Home"
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
    Then I wait for 1 seconds
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
    Then I press "Home"
    Then I press "menu_button"
    Then I press "delete"       
    Then I swipe to left  

Scenario: Delete plugin
    Then I swipe to next board
    Then I press "icon"
    Then I press "PLUGINS"
    Then I press "AM Radio"
    Then I see "AM Radio"
    Then I press "menu_button"
    Then I press "delete"
    Then I don't see "AM Radio"
    Then I swipe to left

Scenario: Replace plugin
    Then I swipe to next board
    Then I press "icon"
    Then I press "PLUGINS"
    Then I press "AM Radio"
    Then I see "AM Radio"
    Then I press "menu_button"
    Then I press "replace"
    Then I press "PLUGINS"
    Then I press "GMusic"
    Then I wait
    Then I see "GMusic"
    Then I check "icon" status "GMusic"
    #Then I swipe to left
    #Then I wait
    #Then I drag from 75:50 to 35:50 moving with 10 steps
    #And I see "GMusic"
    Then I press "menu_button"
    Then I press "delete"
    Then I swipe to left

Scenario: Add multiple plugins
    Then I drag from 75:50 to 35:50 moving with 10 steps
    Then I press "icon"
    Then I press "PLUGINS"
    Then I press "Local Music"
    Then I press "icon"
    Then I press "PLUGINS"
    #Then I use_new_scroll down
    Then I press "Where is My Car"
    Then I see "Local Music"
    Then I see "Where is My Car"
    Then I swipe to left
    Then I drag from 75:50 to 35:50 moving with 10 steps
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
    Then I wait for 3 seconds
    Then I swipe to down
    Then I press "next_button"
    Then I press "prev_button"
    Then I press "play_button_additional"
    Then I go back
    Then I wait for 1 second

Scenario: Swipe-up location menu
    Then I wait for 2 seconds
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
    Then I scroll to text "Media Rescan"
    Then I press "Music home folder"
    Then I scroll to text "Music"
    Then I press "Music"
    Then I press "01 LocalMusicTestSuite"
    Then I press "Select"
    Then I press "leftButtonFirst"
    Then I press "Albums"
    Then I press "Artists"
    Then I press "Songs"
    Then I press "01 Mine"
    Then I press "Artists"
    Then I press "Albums"
    Then I press "Playlists"
    Then I press "Folders"
    Then I press "leftButtonFirst"
    Then I press "Home"
        
    Then I restart application
    Then I wait for 2 seconds
    Then I swipe to down
    And I see "01 Mine"
    And I see "03 Taylor Swift"
    Then I press "play_button_additional"
    #Then I tap on cover
    #Then I wait for 3 seconds
    #Then I press "slide_panel_now_playing_title"
    #Then I check player playing
    #Then I wait for 5 seconds
    
    Then I restart application
    Then I wait for 2 seconds
    Then I swipe to down
    And I see "01 Mine"
    And I see "03 Taylor Swift"
    Then I press "play_button_additional"
    #Then I wait for 3 seconds
    #Then I check player playing
    
    Then I restart application
    Then I wait for 2 seconds
    Then I swipe to down
    And I see "01 Mine"
    And I see "03 Taylor Swift"
    Then I press "play_button_additional"
    #Then I wait for 3 seconds
    #Then I check player playing

    Then I restart application
    Then I wait for 2 seconds
    Then I swipe to down
    And I see "01 Mine"
    And I see "03 Taylor Swift"
    Then I press "play_button_additional"
    #Then I wait for 3 seconds
    #Then I check player playing

    Then I restart application
    Then I wait for 2 seconds
    Then I swipe to down
    And I see "01 Mine"
    And I see "03 Taylor Swift"
    Then I press "play_button_additional"
    #Then I wait for 3 seconds
    #Then I check player playing

    Then I restart application
    Then I wait for 2 seconds
    Then I swipe to down
    And I see "01 Mine"
    And I see "03 Taylor Swift"
    Then I press "play_button_additional"
    #Then I wait for 3 seconds
    #Then I check player playing

    Then I restart application
    Then I wait for 2 seconds
    Then I swipe to down
    And I see "01 Mine"
    And I see "03 Taylor Swift"
    Then I press "play_button_additional"
    #Then I wait for 3 seconds
    #Then I check player playing

    Then I restart application
    Then I wait for 2 seconds
    Then I swipe to down
    And I see "01 Mine"
    And I see "03 Taylor Swift"
    Then I press "play_button_additional"
    #Then I wait for 3 seconds
    #Then I check player playing

    Then I restart application
    Then I wait for 2 seconds
    Then I swipe to down
    And I see "01 Mine"
    And I see "03 Taylor Swift"
    Then I press "play_button_additional"
    #Then I wait for 3 seconds
    #Then I check player playing

    Then I restart application
    Then I wait for 2 seconds
    Then I swipe to down
    And I see "01 Mine"
    And I see "03 Taylor Swift"
    Then I press "play_button_additional"
    #Then I wait for 3 seconds
    #Then I check player playing     


Scenario: Check track position
    Then I press "icon"
    Then I wait for 2 seconds
    Then I press "Albums"
    Then I press "Artists"
    Then I press "Songs"
    Then I press "01 Mine"
    Then I press "slide_panel_now_playing_title"
    And I see "03 Taylor Swift"
    Then I press "status_text"
    Then I check timer    
    Then I restart application
    Then I wait for 1 seconds
    Then I swipe to down
    Then I tap on cover
    Then I wait for 3 seconds
    Then I check play position
    Then I check Music playing
    
    Then I press "status_text"
    Then I check timer
    Then I wait for 1 seconds  
    Then I restart application
    Then I wait for 1 seconds
    Then I tap on cover
    Then I wait for 3 seconds
    Then I check play position
    Then I check Music playing

    Then I press "status_text"
    Then I check timer  
    Then I wait for 1 seconds
    Then I restart application
    Then I wait for 1 seconds
    Then I tap on cover
    Then I wait for 3 seconds
    Then I check play position
    Then I check Music playing

    Then I press "status_text"
    Then I check timer 
    Then I wait for 1 seconds 
    Then I restart application
    Then I wait for 1 seconds
    Then I tap on cover
    Then I wait for 3 seconds
    Then I check play position
    Then I check Music playing

    # Check when track paused
    Then I tap on cover
    Then I press "01 Message in a Bottle"
    # Then I press "slide_panel_now_playing_title"
    Then I press "status_text"
    Then I press "pause"
    Then I check timer
    And I see "02 The Police"    
    Then I restart application
    Then I wait for 1 seconds
    Then I tap on cover
    Then I wait for 3 seconds
    Then I check pause position
    Then I check Music pause

    Then I check timer
    Then I restart application
    Then I wait for 1 seconds
    Then I tap on cover
    Then I wait for 3 seconds
    Then I check pause position
    Then I check Music pause

    Then I check timer
    Then I restart application
    Then I wait for 1 seconds
    Then I tap on cover
    Then I wait for 3 seconds
    Then I check pause position
    Then I check Music pause

    Then I check timer
    Then I restart application
    Then I wait for 1 seconds
    Then I tap on cover
    Then I wait for 3 seconds
    Then I check pause position
    Then I check Music pause

Scenario: Check if all dialogs popup in the Settings are displayed after rotate device 
    Then I press "leftButtonFirst"
    Then I press "Settings"
    #Then I scroll to text "Sticky icon"
    #Then I press "Sticky icon"
    #Then I press "None"

    #Then I press "Bluetooth connection"
    #Then I see "Bluetooth connection"
    #Then I see "OK"
    #Then I see "Cancel"
    #Then I rotate device to landscape
    #Then I wait
    #Then I rotate device to portrait
    #Then I see "OK"
    #Then I see "Cancel"
    #Then I press "Cancel"

    #Then I scroll to text "Sticky icon"
    #Then I press "Sticky icon"
    #Then I see "None"
    #Then I see "Rotation lock"
    #Then I see "Brightness"
    #Then I see "Cancel"
    #Then I rotate device to landscape
    #Then I wait
    #Then I rotate device to portrait
    #Then I see "None"
    #Then I see "Rotation lock"
    #Then I see "Brightness"
    #Then I see "Cancel"
    #Then I press "Cancel"

    Then I scroll to text "Navigation"
    Then I press "Navigation"
    Then I see "Navigation"
    Then I see "Maps"
    Then I see "Cancel"
    Then I rotate device to landscape
    Then I wait
    Then I rotate device to portrait
    Then I see "Navigation"
    Then I see "Maps"
    Then I see "Cancel"
    Then I press "Cancel"
