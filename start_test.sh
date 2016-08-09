#! /bin/bash
export ADB_DEVICE_ARG="0481d7e816950fd5"
export ANDROID_HOME=/home/tolik/ADP/adt-bundle-linux-x86_64-20140702/sdk
calabash-android run /home/tolik/calabash-test-android/15010.apk ADB_DEVICE_ARG="0481d7e816950fd5"
