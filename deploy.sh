#!/bin/bash

if [[ "$(whoami)" != "${BUILD_USER-root}" ]]; then
    echo "Error: This script must be run with ${BUILD_USER-root} priveleges" >&2
    exit 1
fi

function build_aarch64_fn() {
    rm /var/lib/manjaro-arm-tools/pkg/aarch64/var/cache/pacman/pkg/*
    buildarmpkg -k -p $*
    rsync /var/cache/manjaro-arm-tools/pkg/aarch64/ /var/lib/manjaro-arm-tools/pkg/aarch64/srv/repo/ -r
    rm /var/lib/manjaro-arm-tools/pkg/aarch64/srv/repo/selfbuild.db.tar.xz
    repo-add /var/lib/manjaro-arm-tools/pkg/aarch64/srv/repo/selfbuild.db.tar.xz /var/lib/manjaro-arm-tools/pkg/aarch64/srv/repo/*.zst
    manjaro-chroot /var/lib/manjaro-arm-tools/pkg/aarch64/ pacman -Syyu
}

if [ "$BUILDARCH" == "aarch64" ]; then
    echo "Build for arm64 arch"
    BUILD="${BUILD-build_aarch64_fn}"
else
    echo "Build for $(uname -m) arch"
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
eval "$BUILD glacier-camera-git"
eval "$BUILD nemo-qml-plugin-folderlistmodel-git"
eval "$BUILD glacier-filemuncher-git"
eval "$BUILD meego-resource-git"
eval "$BUILD qt5-resource-git"
eval "$BUILD nemo-qml-plugin-thumbnailer-git"
eval "$BUILD qtdocgallery-git"
eval "$BUILD glacier-gallery-git"
eval "$BUILD qt5-dbus-extended-git"
eval "$BUILD qt5-mpris-git"
eval "$BUILD glacier-music-git"

# homescreen/de
eval "$BUILD mce-headers-git"
eval "$BUILD libiphb-git"
eval "$BUILD nemo-keepalive-git"
eval "$BUILD ssu-sysinfo-git"
eval "$BUILD nemo-qml-plugin-devicelock-git"
eval "$BUILD qt5-mlite-git"
eval "$BUILD nemo-qml-plugin-configuration-git"
eval "$BUILD nemo-qml-plugin-statusnotifier-git"
eval "$BUILD qt5-iodata-git"
eval "$BUILD sailfish-access-control-git"
eval "$BUILD qt5-timed-git"
eval "$BUILD nemo-qml-plugin-time-git"
eval "$BUILD qt5-pim-git"
eval "$BUILD qt5-mlocale-git"
eval "$BUILD nemo-qml-plugin-models"
eval "$BUILD libngf-git"
eval "$BUILD usb-moded-git"
eval "$BUILD mce-git"
eval "$BUILD sensorfw-git"
eval "$BUILD qt5-mce-git"
eval "$BUILD qt5-contacts-sqlite-extensions-git"
eval "$BUILD nemo-qml-plugin-notifications-git"
eval "$BUILD libqofono-qt5"
eval "$BUILD glacier-pinquery-git" # additional app
eval "$BUILD qt5-ofono-nemo-extensions-git"
eval "$BUILD qt5-connman-git"
eval "$BUILD nemo-qml-plugin-contentaction-git"
eval "$BUILD qt5-ngfd-git"
eval "$BUILD qt5-usb-moded-git"
eval "$BUILD libuser"
eval "$BUILD sailfish-user-managerd-git"
eval "$BUILD profiled-git"
eval "$BUILD libsailfishkeyprovider-git"
eval "$BUILD nemo-qml-plugin-systemsettings-git"
eval "$BUILD mapplauncherd-git"
eval "$BUILD mapplauncherd-qt-git"
eval "$BUILD mapplauncherd-booster-qtcomponents-git"
eval "$BUILD qt5-lipstick-git"
eval "$BUILD nemo-qml-plugin-connectivity-git"
eval "$BUILD glacier-settings-git"

eval "$BUILD buteo-syncfw"
eval "$BUILD buteo-sync-plugin-carddav-git"
eval "$BUILD nemo-qml-plugin-contacts-git"
eval "$BUILD lipstick-glacier-home-git"
eval "$BUILD glacier-wayland-session"

eval "$BUILD libcommhistory-git"
eval "$BUILD commhistory-daemon-git"
eval "$BUILD qmf-qt5"
eval "$BUILD nemo-qml-plugin-messages-git"
eval "$BUILD mkcal-git"
eval "$BUILD contactsd-git"
eval "$BUILD glacier-messages-git"
eval "$BUILD glacier-contacts-git"
eval "$BUILD voicecall"
eval "$BUILD glacier-dialer-git"

eval "$BUILD glacier-browser-git"

# need to be clarified
eval "$BUILD qt5-profile-git"
eval "$BUILD qt5-around-git"
eval "$BUILD sailfish-access-control-qt5-git"

eval "$BUILD usb-tethering"

#multimedia stuff
eval "$BUILD pulsecore-headers"
eval "$BUILD pulseaudio-module-keepalive"
eval "$BUILD pulseaudio-modules-nemo"

eval "$BUILD libdsme"
eval "$BUILD dsme-git"
eval "$BUILD libprolog"
eval "$BUILD libtrace-ohm"
eval "$BUILD mce-plugin-libhybris-nondroid-git"
eval "$BUILD ohm"
eval "$BUILD ohm-rule-engine"
eval "$BUILD libdres-ohm"
eval "$BUILD ohm-plugins-misc"
eval "$BUILD policy-settings-common"
eval "$BUILD maliit-nemo-keyboard-git"


eval "$BUILD fingerterm-git"

# arm specific packages
if [ "$BUILDARCH" == "aarch64" ]; then
    eval "$BUILD hybris/android-headers"
    eval "$BUILD hybris/libhybris"
    eval "$BUILD hybris/qt5-qpa-hwcomposer-plugin"

    eval "$BUILD devices/nemo-device-pinephone"
fi
