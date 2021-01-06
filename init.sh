#!/bin/bash

PROJECT_REPOS_PATH=https://github.com/nemomobile-ux/nemo-packaging/

# create project directory
mkdir -p nemo-packaging

# enter the project
cd nemo-packaging

# clone all the projects

# apps
git clone "$PROJECT_REPOS_PATH"tut-git
git clone "$PROJECT_REPOS_PATH"cor-git

git clone "$PROJECT_REPOS_PATH"nemo-theme-glacier-git
git clone "$PROJECT_REPOS_PATH"qt5-quickcontrols-nemo-git
git clone "$PROJECT_REPOS_PATH"qt5-glacier-app-git
git clone "$PROJECT_REPOS_PATH"glacier-calc-git
git clone "$PROJECT_REPOS_PATH"nemo-qml-plugin-settings-git
git clone "$PROJECT_REPOS_PATH"glacier-camera-git
git clone "$PROJECT_REPOS_PATH"nemo-qml-plugin-folderlistmodel-git
git clone "$PROJECT_REPOS_PATH"glacier-filemuncher-git
git clone "$PROJECT_REPOS_PATH"meego-resource-git
git clone "$PROJECT_REPOS_PATH"qt5-resource-git
git clone "$PROJECT_REPOS_PATH"nemo-qml-plugin-thumbnailer-git
git clone "$PROJECT_REPOS_PATH"glacier-gallery-git
git clone "$PROJECT_REPOS_PATH"qt5-dbus-extended-git
git clone "$PROJECT_REPOS_PATH"qt5-mpris-git
git clone "$PROJECT_REPOS_PATH"glacier-music-git
# glacier-pinquery-git after qt5-ofono-git

# homescreen/de

git clone "$PROJECT_REPOS_PATH"mce-headers-git
git clone "$PROJECT_REPOS_PATH"libiphb-git
git clone "$PROJECT_REPOS_PATH"nemo-keepalive-git
git clone "$PROJECT_REPOS_PATH"nemo-qml-plugin-dbus-git
git clone "$PROJECT_REPOS_PATH"ssu-sysinfo-git
git clone "$PROJECT_REPOS_PATH"nemo-qml-plugin-devicelock-git
git clone "$PROJECT_REPOS_PATH"qt5-mlite-git
git clone "$PROJECT_REPOS_PATH"nemo-qml-plugin-configuration-git
git clone "$PROJECT_REPOS_PATH"nemo-qml-plugin-statusnotifier-git
git clone "$PROJECT_REPOS_PATH"qt5-iodata-git
git clone "$PROJECT_REPOS_PATH"sailfish-access-control-git
git clone "$PROJECT_REPOS_PATH"qt5-timed-git
git clone "$PROJECT_REPOS_PATH"nemo-qml-plugin-time-git
git clone "$PROJECT_REPOS_PATH"qt5-pim-git
git clone "$PROJECT_REPOS_PATH"qt5-mlocale-git
git clone "$PROJECT_REPOS_PATH"libngf-git
git clone "$PROJECT_REPOS_PATH"usb-moded-git
git clone "$PROJECT_REPOS_PATH"mce-git
git clone "$PROJECT_REPOS_PATH"qt5-mce-git
git clone "$PROJECT_REPOS_PATH"qt5-contacts-sqlite-extensions-git
git clone "$PROJECT_REPOS_PATH"qt5-contacts-git
git clone "$PROJECT_REPOS_PATH"nemo-qml-plugin-contacts-git
git clone "$PROJECT_REPOS_PATH"nemo-qml-plugin-notifications-git
git clone "$PROJECT_REPOS_PATH"qt5-ofono-git
git clone "$PROJECT_REPOS_PATH"glacier-pinquery-git # additional app
git clone "$PROJECT_REPOS_PATH"qt5-ofono-nemo-extensions-git
git clone "$PROJECT_REPOS_PATH"qt5-connman-git
git clone "$PROJECT_REPOS_PATH"nemo-qml-plugin-contentaction-git
git clone "$PROJECT_REPOS_PATH"qt5-ngfd-git
git clone "$PROJECT_REPOS_PATH"qt5-usb-moded-git
git clone "$PROJECT_REPOS_PATH"nemo-qml-plugin-models-git
git clone "$PROJECT_REPOS_PATH"libuser
git clone "$PROJECT_REPOS_PATH"sailfish-user-managerd-git
git clone "$PROJECT_REPOS_PATH"profiled-git
git clone "$PROJECT_REPOS_PATH"libsailfishkeyprovider-git
git clone "$PROJECT_REPOS_PATH"nemo-qml-plugin-systemsettings-git
git clone "$PROJECT_REPOS_PATH"qt5-lipstick-git
git clone "$PROJECT_REPOS_PATH"lipstick-glacier-home-git
git clone "$PROJECT_REPOS_PATH"glacier-wayland-session

# need to be clarified

git clone "$PROJECT_REPOS_PATH"qt5-profile-git
git clone "$PROJECT_REPOS_PATH"qt5-around-git
git clone "$PROJECT_REPOS_PATH"sailfish-access-control-qt5-git

echo "cloned everything"
