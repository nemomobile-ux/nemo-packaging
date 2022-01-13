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
    manjaro-chroot /var/lib/manjaro-arm-tools/pkg/aarch64/ pacman -Syyu --noconfirm
}

if [ "$BUILDARCH" == "aarch64" ]; then
    echo "Build for arm64 arch"
    BUILD="${BUILD-build_aarch64_fn}"
else
    echo "Build for $(uname -m) arch"
    BUILD="${BUILD-buildpkg -n -p}"
fi

# apps
eval "$BUILD google-opensans-fonts"
eval "$BUILD nemo-theme-glacier-git"
eval "$BUILD nemo-theme-openmoko-git"
eval "$BUILD maliit-nemo-keyboard-git"
eval "$BUILD qt5-quickcontrols-nemo-git"
eval "$BUILD qt5-glacier-app-git"
eval "$BUILD glacier-calc-git"
eval "$BUILD nemo-qml-plugin-settings-git"
eval "$BUILD glacier-camera-git"
eval "$BUILD nemo-qml-plugin-folderlistmodel"
eval "$BUILD glacier-filemuncher-git"
eval "$BUILD libresource"
eval "$BUILD libresourceqt"
eval "$BUILD qtmpris"
eval "$BUILD glacier-music-git"
eval "$BUILD glacier-packagemanager-git"
eval "$BUILD glacier-polkit-agent"

# homescreen/de
eval "$BUILD mce-headers"
eval "$BUILD libiphb"
eval "$BUILD nemo-keepalive"
eval "$BUILD nemo-qml-plugin-devicelock"
eval "$BUILD glacier-devicelock-plugin"
eval "$BUILD mlite"
eval "$BUILD nemo-qml-plugin-thumbnailer"
eval "$BUILD qtdocgallery-git"
eval "$BUILD glacier-gallery-git"
eval "$BUILD nemo-qml-plugin-configuration"
eval "$BUILD nemo-qml-plugin-statusnotifier-git"
eval "$BUILD qt5-quickcontrols-nemo-examples-git"
eval "$BUILD libiodata"
eval "$BUILD sailfish-access-control"
eval "$BUILD tzdata-timed"
eval "$BUILD timed"
eval "$BUILD nemo-qml-plugin-time"
eval "$BUILD qt5-pim-git"
eval "$BUILD libmlocale"
eval "$BUILD nemo-qml-plugin-models"
eval "$BUILD libngf"
eval "$BUILD usb-moded"
eval "$BUILD mce"
eval "$BUILD sensorfw"
eval "$BUILD qt5-sensors-sensorfw"
eval "$BUILD libmce-qt"
eval "$BUILD qtcontacts-sqlite"
eval "$BUILD nemo-qml-plugin-notifications"
eval "$BUILD libqofono-qt5"
eval "$BUILD glacier-pinquery-git" # additional app
eval "$BUILD libqofonoext"
eval "$BUILD libconnman-qt"
eval "$BUILD libngf-qt"
eval "$BUILD libusb-moded-qt"
eval "$BUILD profiled-settings-nemo"
eval "$BUILD profiled"
eval "$BUILD nemo-qml-plugin-systemsettings-git"
eval "$BUILD qt5-lipstick-git"
eval "$BUILD qt5-systems"
eval "$BUILD nemo-qml-plugin-connectivity"
eval "$BUILD glacier-settings-git"

eval "$BUILD buteo-syncfw"
eval "$BUILD buteo-sync-plugin-carddav"
eval "$BUILD nemo-qml-plugin-contacts"

eval "$BUILD libprofile-qt"
eval "$BUILD qt-mobility-haptics-ffmemless"

#multimedia stuff
eval "$BUILD pulsecore-headers"
eval "$BUILD pulseaudio-module-keepalive"

eval "$BUILD libdsme"
eval "$BUILD dsme"
eval "$BUILD swi-prolog7"
eval "$BUILD libprolog"
eval "$BUILD libtrace-ohm"
eval "$BUILD mce-plugin-libhybris-nondroid"
eval "$BUILD ohm"
eval "$BUILD libdres-ohm"
eval "$BUILD policy-settings-common"
eval "$BUILD ohm-plugins-misc"
eval "$BUILD ohm-rule-engine"

eval "$BUILD fingerterm"

eval "$BUILD glacier-testtool-git"
eval "$BUILD ngfd"
eval "$BUILD ngfd-settings-nemo"
eval "$BUILD ngfd-plugin-native-vibrator"


eval "$BUILD lipstick-glacier-home-git"
eval "$BUILD glacier-wayland-session-git"

eval "$BUILD libcommhistory"
eval "$BUILD commhistory-daemon"
eval "$BUILD qmf-qt5"
eval "$BUILD nemo-qml-plugin-accounts-git"
eval "$BUILD nemo-qml-plugin-signon-git"
eval "$BUILD nemo-qml-plugin-messages-git"
eval "$BUILD mkcal-git"
eval "$BUILD contactsd-git"
eval "$BUILD glacier-contacts-git"
eval "$BUILD telepathy-mission-control"
eval "$BUILD glacier-messages-git"
eval "$BUILD voicecall"
eval "$BUILD glacier-dialer-git"

eval "$BUILD nemo-qml-plugin-email-git"
eval "$BUILD glacier-mail-git"

eval "$BUILD glacier-browser-git"

# need to be clarified
eval "$BUILD usb-tethering"


# pure-maps packages
if [ "$BUILDARCH" != "aarch64" ]; then
    eval "$BUILD python-otherside"
fi
eval "$BUILD abseil-cpp-git"
eval "$BUILD gpxpy-git"
eval "$BUILD s2geometry-git"
eval "$BUILD mapbox-gl-native-git"
eval "$BUILD mapbox-gl-qml-git"
eval "$BUILD pure-maps-git"

eval "$BUILD glacier-weather-git"


eval "$BUILD qt5-feedback-haptics-native-vibrator"
eval "$BUILD libsocialcache"
eval "$BUILD buteo-sync-plugins-social"

eval "$BUILD nemo-qml-plugin-alarms-git"


# arm specific packages
if [ "$BUILDARCH" == "aarch64" ]; then
    eval "$BUILD bootsplash-theme-nemo" # for x86_64 plymouth-theme-
    eval "$BUILD hybris/android-headers"
    eval "$BUILD hybris/libhybris"
    eval "$BUILD hybris/qt5-qpa-hwcomposer-plugin"

    eval "$BUILD devices/nemo-device-pinephone"
    eval "$BUILD devices/nemo-device-pinetab"
fi
