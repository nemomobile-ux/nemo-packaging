#!/bin/bash

if [[ "$(whoami)" != "${BUILD_USER-root}" ]]; then
    echo "Error: This script must be run with ${BUILD_USER-root} priveleges" >&2
    exit 1
fi


if [ "$BUILDARCH" == "aarch64" ] 
then
    echo "Build for arm64 arch"
    BUILD="${BUILD-buildarmpkg -k -p}"
else
    echo 'Build for x86_64 arch'
    BUILD="${BUILD-buildpkg -n -p}"
fi

# apps
eval "$BUILD tut-git"
eval "$BUILD cor-git"

eval "$BUILD google-opensans-fonts"
eval "$BUILD nemo-theme-glacier-git"
eval "$BUILD qt5-quickcontrols-nemo-git"
eval "$BUILD qt5-glacier-app-git"
eval "$BUILD glacier-calc-git"
eval "$BUILD nemo-qml-plugin-settings-git"
eval "$BUILD nemo-qml-plugin-sortfiltermodel-git"
eval "$BUILD glacier-camera-git"
eval "$BUILD  nemo-qml-plugin-folderlistmodel-git"
eval "$BUILD  glacier-filemuncher-git"
eval "$BUILD  meego-resource-git"
eval "$BUILD  qt5-resource-git"
eval "$BUILD  nemo-qml-plugin-thumbnailer-git"
eval "$BUILD  glacier-gallery-git"
eval "$BUILD  qt5-dbus-extended-git"
eval "$BUILD  qt5-mpris-git"
eval "$BUILD  glacier-music-git"

# homescreen/de
eval "$BUILD  mce-headers-git"
eval "$BUILD  libiphb-git"
eval "$BUILD  nemo-keepalive-git"
eval "$BUILD  nemo-qml-plugin-dbus-git"
eval "$BUILD  ssu-sysinfo-git"
eval "$BUILD  nemo-qml-plugin-devicelock-git"
eval "$BUILD  qt5-mlite-git"
eval "$BUILD  nemo-qml-plugin-configuration-git"
eval "$BUILD  nemo-qml-plugin-statusnotifier-git"
eval "$BUILD  qt5-iodata-git"
eval "$BUILD  sailfish-access-control-git"
eval "$BUILD  qt5-timed-git"
eval "$BUILD  nemo-qml-plugin-time-git"
eval "$BUILD  qt5-pim-git"
eval "$BUILD  qt5-mlocale-git"
eval "$BUILD  libngf-git"
eval "$BUILD  usb-moded-git"
eval "$BUILD  mce-git"
eval "$BUILD  mce-dsme"
eval "$BUILD  sensorfw-git"
eval "$BUILD  qt5-mce-git"
eval "$BUILD  qt5-contacts-sqlite-extensions-git"
eval "$BUILD  qt5-contacts-git"
eval "$BUILD  nemo-qml-plugin-notifications-git"
eval "$BUILD  qt5-ofono-git"
eval "$BUILD  glacier-pinquery-git" # additional app
eval "$BUILD  qt5-ofono-nemo-extensions-git"
eval "$BUILD  qt5-connman-git"
eval "$BUILD  nemo-qml-plugin-contentaction-git"
eval "$BUILD  qt5-ngfd-git"
eval "$BUILD  qt5-usb-moded-git"
eval "$BUILD  nemo-qml-plugin-models-git"
eval "$BUILD  libuser"
eval "$BUILD  sailfish-user-managerd-git"
eval "$BUILD  profiled-git"
eval "$BUILD  libsailfishkeyprovider-git"
eval "$BUILD  nemo-qml-plugin-systemsettings-git"
eval "$BUILD  mapplauncherd-git"
eval "$BUILD  mapplauncherd-qt-git"
eval "$BUILD  qt5-lipstick-git"
eval "$BUILD  lipstick-glacier-home-git"
eval "$BUILD  glacier-wayland-session"

#messages pim voicecalls
eval "$BUILD  buteo-syncfw"
eval "$BUILD  buteo-sync-plugin-carddav-git"
eval "$BUILD  libcommhistory-git"
eval "$BUILD  commhistory-daemon-git"
eval "$BUILD  nemo-qml-plugin-contacts-git"

eval "$BUILD  nemo-qml-plugin-messages-git"
eval "$BUILD  glacier-messages-git"

# need to be clarified
eval "$BUILD  qt5-profile-git"
eval "$BUILD  qt5-around-git"
eval "$BUILD  sailfish-access-control-qt5-git"
eval "$BUILD  qmf-qt5"
eval "$BUILD  mkcal-git"
