## Calabash installation instruction:
1. First methods:
https://gorails.com/setup/ubuntu/14.04

cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 2.3.1
rbenv global 2.3.1
ruby -v
The last step is to install Bundler
gem install bundler
rbenv users need to run 
rbenv rehash 
after installing bundler.

Download Android SDK and set all the paths to .bashrc:
export ANDROID_HOME=~/android-sdk-linux
export PATH=${PATH}:$ANDROID_HOME/tools
export PATH=${PATH}:$ANDROID_HOME/platform-tools
export PATH=${PATH}:$ANDROID_HOME/add-ons

And update to install build-tools etc:
android update sdk --no-ui

Install calabash for android:
$ gem install calabash-android

2. Second methods:
https://github.com/calabash/calabash-android

3. Third methods:
http://calaba.sh - calabash page

https://blog.testmunk.com/tutorial-for-automated-mobile-app-testing-calabash/ - A Beginner's Guide to Automated Mobile App Testing -> useful blog on configuration and setup

> Installation:
> Install Android Studio
> Install Android studio platform tools
> Install ruby if not available
> Install calabash gem
> calabash-android gen to generate test structure
Configuration:
> Set ANDROID_HOME in console variable . Export ANDROID_HOME=<path_to_sdk_folder>
> Download *apk file into test folder
> Resign application calabash-android resign "APK_NAME"
> To start calabash console : calabash-android console "APK_NAME"
> To resinstall application on device : reinstall_apps
> To start calabash server from a console : start_server_in_background
> To check page elements o : query("*") to get all elements on current opened page on device
> To exit a console : quit
> To run calabash tests run : calabash-android run "APK_NAME"


## Steps for test:
> https://github.com/calabash/calabash-android/blob/master/ruby-gem/lib/calabash-android/canned_steps.md


## Commands for tests: 
Resign application:
> calabash-android resign dashlinq.apk
If resign failed:
keytool -genkey -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=Android Debug,O=Android,C=US"

Start calabash-console:
> calabash-android console dashlinq.apk

Start test server:
> irb(main):001:0> start_test_server_in_background

If start test server do not work: 
> irb(main):001:0> reinstall_apps

View the elements of the program:
> query ("*") 

To exit from console environment:
> quit


## Run tests: 
> export ANDROID_HOME=~/android-sdk-linux
> export ADB_DEVICE_ARG=*****    (* - device id) - If there are plugged multiple devices
> ANDROID_SERIAL=$ADB_DEVICE_ARG; export ANDROID_SERIAL
> Navigate to calabash test folder: cd calabash-test-android
> calabash-android resign deshlinq.apk
> calabash-android console deshlinq.apk
> reinstall_apps
> quit
> calabash-android run deshlinq.apk
or add the settings in "start_test.sh" script and run:
> ./start_test.sh

## To run a single test: 
> calabash-android run dashlinq.apk features/example.feature

## To run a single test with tags:
> calabash-android run dashlinq.apk features/example.feature --tags @example 

## To output test results in html format: 
> calabash-android run dashlinq.apk --format html --out example.html


## Program needed for GMusic tests.
## AndroidViewClient installation instruction:

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


## VPN:
https://wiki.ubuntu.com/VPN

sudo nano /etc/ppp/peers/grom:
pty "pptp 24.5.186.208 --nolaunchpppd"
debug
nodetach
logfd 2
noproxyarp
ipparam GROMAUDIO
remotename GROMAUDIO
name dsigov
require-mppe-128
nobsdcomp
nodeflate
lock
refuse-eap
refuse-chap
Refuse-mschap

Add to /etc/ppp/chap-secrets:
dsigov * <password> *

sudo nano /etc/ppp/ip-up.d/add-subnet:
#!/bin/bash
[ "$PPP_IPPARAM" = "GROMAUDIO" ] || exit 0
route add -net 192.168.0.0/24 dev $PPP_IFACE

sudo chmod a+x /etc/ppp/ip-up.d/add-subnet
sudo pon grom # to connect VPN

Настройка SSH key: http://www.howtogeek.com/168147/add-public-ssh-key-to-remote-server-in-a-single-command/

## Если adb devices не видит устройств:
1. Попробовать перезагрузить телефоны.

2. Попробовать запустить adb с правами рута: sudo adb kill-server-> sudo adb start server-> sudo adb devices - возможно так будет видно телефон

3. Добавляем два правила для udev.

Создаем новый файл 50-android.rules в /etc/udev/rules.d
sudo gedit /etc/udev/rules.d/50-android.rules
idVendor поменять на наш девайс: lsusb - чтобы посмотреть
Для Jaunty/Gusty/Hardy, добавляем следующее:
SUBSYSTEM == "usb", SYSFS {idVendor} == "0bb4", MODE = "0666"

Создаем новый файл 90-android.rules в /etc/udev/rules.d
sudo gedit /etc/udev/rules.d/90-android.rules
idVendor поменять на наш девайс: lsusb - чтобы посмотреть
Для Jaunty/Gusty/Hardy, добавляем следующее:
SUBSYSTEM == "usb", ATTR {idVendor} == "0bb4", MODE = "0666"

- Выставляем права на файлы:
sudo chmod a + rx /etc/udev/rules.d/50-android.rules
sudo chmod a + rx /etc/udev/rules.d/90-android.rules
после всего сделанного возможно понадобится перезапуск сервисов, то есть делаем:
adb kill-server
sudo /etc/init.d/udev restart