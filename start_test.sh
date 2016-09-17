#! /bin/bash

`export ADB_DEVICE_ARG="9fd6b98e"
export ANDROID_HOME=/home/tolik/ADP/adt-bundle-linux-x86_64-20140702/sdk
calabash-android run /home/tolik/calabash-test-android/15115.apk --format html --out S4.html ADB_DEVICE_ARG="9fd6b98e"`&
`export ADB_DEVICE_ARG="TA9921ASBX"
export ANDROID_HOME=/home/tolik/ADP/adt-bundle-linux-x86_64-20140702/sdk
calabash-android run /home/tolik/calabash-test-android/15115.apk --format html --out Nexus5.html ADB_DEVICE_ARG="TA9921ASBX"`&
`export ADB_DEVICE_ARG="060cb3a2005187d2"
export ANDROID_HOME=/home/tolik/ADP/adt-bundle-linux-x86_64-20140702/sdk
calabash-android run /home/tolik/calabash-test-android/15115.apk --format html --out Nexus5.html ADB_DEVICE_ARG="060cb3a2005187d2"`