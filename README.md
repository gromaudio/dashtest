Installation instruction

http://calaba.sh - calabash page

https://blog.testmunk.com/tutorial-for-automated-mobile-app-testing-calabash/ - A Beginner's Guide to Automated Mobile App Testing -> useful blog on configuration and setup

https://github.com/calabash/calabash-android/blob/master/ruby-gem/lib/calabash-android/canned_steps.md - > custom cucumber setups for mobile applications

Installation:

Install Android Studio

Install Android studio platform tools

Install ruby if not available

Install calabash gem

calabash-android gen to generate test structure

Configuration:

Set ANDROID_HOME in console variable . Export ANDROID_HOME=<path_to_sdk_folder>
Download *apk file into test folder

Resign application calabash-android resign "APK_NAME"

To start calabash console : calabash-android console "APK_NAME"

To resinstall application on device : reinstall_apps

To start calabash server from a console : start_server_in_background

To check page elements o : query("*") to get all elements on current opened page on device

To exit a console : quit

To run calabash tests run : calabash-android run "APK_NAME"




AndroidViewClient instruction:

Install:

1. sudo apt-get install python-setuptools

2. sudo easy_install --upgrade androidviewclient

3. sudo apt-get install python-pip

4. sudo apt-get install git

5. sudo pip install git+https://github.com/dtmilano/AndroidViewClient.git

6. Clone lib https://github.com/dtmilano/AndroidViewClient.git

7. export ANDROID_VIEW_CLIENT_HOME=/path/to/androidviewclient/

Verifying environment setup

$ cd /path/to/androidviewclient

$ cd examples

$ python check-import.py

if everything is fine, you will receive OK
