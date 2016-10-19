#! /bin/bash

`export ADB_DEVICE_ARG="TA9921ASBX"
ANDROID_SERIAL=$ADB_DEVICE_ARG; export ANDROID_SERIAL
export ANDROID_HOME=/home/tolik/ADP/adt-bundle-linux-x86_64-20140702/sdk
calabash-android run /home/tolik/calabash-test-android/16020.apk --format html --out Moto_191016.html ADB_DEVICE_ARG="TA9921ASBX" SCREENSHOT_PATH=/home/tolik/calabash-test-android/screenshots/screenshotsMoto/`&
`export ADB_DEVICE_ARG="9fd6b98e"
ANDROID_SERIAL=$ADB_DEVICE_ARG; export ANDROID_SERIAL
export ANDROID_HOME=/home/tolik/ADP/adt-bundle-linux-x86_64-20140702/sdk
calabash-android run /home/tolik/calabash-test-android/16020.apk --format html --out S4_191016.html ADB_DEVICE_ARG="9fd6b98e" SCREENSHOT_PATH=/home/tolik/calabash-test-android/screenshots/screenshotsS4/`&
`export ADB_DEVICE_ARG="009bdcbd935ab800"
ANDROID_SERIAL=$ADB_DEVICE_ARG; export ANDROID_SERIAL
export ANDROID_HOME=/home/tolik/ADP/adt-bundle-linux-x86_64-20140702/sdk
calabash-android run /home/tolik/calabash-test-android/16020.apk --format html --out N4_191016.html ADB_DEVICE_ARG="009bdcbd935ab800" SCREENSHOT_PATH=/home/tolik/calabash-test-android/screenshots/screenshotsNexus4/`&
`export ADB_DEVICE_ARG="060cb3a2005187d2"
ANDROID_SERIAL=$ADB_DEVICE_ARG; export ANDROID_SERIAL
export ANDROID_HOME=/home/tolik/ADP/adt-bundle-linux-x86_64-20140702/sdk
calabash-android run /home/tolik/calabash-test-android/16020.apk --format html --out N5_191016.html ADB_DEVICE_ARG="060cb3a2005187d2" SCREENSHOT_PATH=/home/tolik/calabash-test-android/screenshots/screenshotsNexus5/`&