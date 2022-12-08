#!/bin/bash

# list of packages grabbed from manjaro
declare have
have+="curl icu zlib lightdm glib2 dbus-glib sqlite systemd systemd-libs libsystemd net-tools dhcp udev git tzdata gstreamer readline cryptsetup "
have+="qt5-location qt5-webengine qt5-svg qt5-declarative qt5-base qt5-quickcontrols qt5-wayland qt5-multimedia qt5-feedback qt5-charts qt5-graphicaleffects qt5-quickcontrols2 "
have+="telepathy-qt telepathy-glib telepathy-ofono libpulse pulseaudio python openssl libaccounts-qt bluez-qt kcalendarcore maliit-framework qt5-xmlpatterns dconf libarchive "
have+="libphonenumber tracker3 tracker3-miners ofono connman check kmod signond gtest libpamac fprintd taglib nemo-qml-plugin-dbus polkit-qt5 geoclue gmp "
have+="libcanberra python-pyxdg libsoup json-glib libmm-glib avahi geocode-glib gobject-introspection vala meson libnotify libxml2 pkgconf "
have+="bluez dbus modemmanager mobile-broadband-provider-info qt5-networkauth telepathy-mission-control libofono-qt debianutils pcre hunspell-en_us presage2-lang-en_US "
have+="cmake qt5-tools automake autoconf libtool doxygen bison flex libxft libjpeg libxpm extra-cmake-modules libxslt graphviz gtk-doc python-setuptools unixodbc libxinerama " # makedepends
have+="make pkgconfig gtk2 gtk3 boost boost-libs protobuf "
have+="tinyxml2 marisa hunspell cppunit "


have+=" " # must end with space


function build_directory() {
    to_add=$(
        source "$1/PKGBUILD" || {
            echo "Error: cannot source $1/PKGBUILD" >&2
        }
        echo "$pkgname ${provides[@]} "
    )
    (
        source "$1/PKGBUILD" &>/dev/null
        for i in "${depends[@]}" "${makedepends[@]}"; do
            # remove version from package name
            i=${i%>*}
            i=${i%=*}
            i=${i%<*}
            found="false"
            for j in $have; do
                if [ "$j" = "$i" ]; then
                    found="true"
                    continue
                fi
            done
            if [ "$found" = "false" ]; then
                echo "$to_add depends on missing $i" >&2
            fi
        done
    )
#    echo $to_add
    have+="$to_add "
    export have
}

function check_have() {
    to_add=$(
        source "$1/PKGBUILD" || {
            echo "Error: cannot source $1/PKGBUILD" >&2
        }
        echo "$pkgname ${provides[@]} "
    )
        for i in $to_add; do
            found="false"
            for j in $have; do
                if [ "$j" = "$i" ]; then
                    found="true"
                    continue
                fi
            done
            if [ "$found" = "true" ]; then
                echo "Error: $i in \$have"
            fi
        done
}

export BUILD_USER="$(whoami)"
if /bin/false; then
    export BUILD="check_have"
else
    export BUILD="build_directory"
fi
export -f build_directory
source ./deploy.sh

# declare -p have