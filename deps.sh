#!/bin/bash

# list of packages grabbed from manjaro
declare have
have+="clang curl icu zlib lightdm glib2 dbus-glib sqlite systemd systemd-libs libsystemd net-tools dhcp udev git tzdata gstreamer readline cryptsetup "
have+="qt6-location qt6-webengine qt6-svg qt6-declarative qt6-base qt6-quickcontrols qt6-wayland qt6-multimedia qt6-feedback qt6-charts qt6-graphicaleffects "
have+="qt6-quickcontrols2 qt6-connectivity ninja qt6-5compat python-requests qt6-doc "
have+="telepathy-qt telepathy-glib telepathy-ofono libpulse pulseaudio python openssl bluez-qt maliit-framework qt6-xmlpatterns dconf libarchive "
have+="tracker3 tracker3-miners ofono connman check kmod signond gtest libpamac fprintd taglib nemo-qml-plugin-dbus polkit-qt5 geoclue gmp "
have+="libcanberra python-pyxdg libsoup json-glib libmm-glib avahi geocode-glib gobject-introspection vala meson libnotify libxml2 pkgconf "
have+="bluez dbus modemmanager mobile-broadband-provider-info qt6-networkauth qt6-shadertools qt6-positioning perl telepathy-mission-control libofono-qt debianutils pcre hunspell-en_us presage2-lang-en_US "
have+="libatomic_ops alsa-lib bluez-libs wayland-protocols "
have+="cmake qt6-tools automake autoconf libtool doxygen bison flex libxft libjpeg libxpm extra-cmake-modules libxslt graphviz gtk-doc python-setuptools unixodbc libxinerama " # makedepends
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