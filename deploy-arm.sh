#!/bin/bash

# install manjaro-tools
# https://wiki.manjaro.org/index.php?title=Manjaro-tools

# view commands
# the default deploy path is: /var/cache/manjaro-arm-tools/pkg/aarch64
# the default rootfs path is: /var/lib/manjaro-arm-tools/pkg/aarch64/
# https://gitlab.manjaro.org/manjaro-arm/applications/manjaro-arm-tools/-/tree/master
sudo buildarmpkg -h

# enter the project
cd nemo-packaging

# build all the packages, add -k option to keep existing chroot

## stuff
## pacman -U $(find /var/cache/pacman/pkg/ -name *pkg.tar.xz)
## manjaro-chroot /var/lib/manjaro-arm-tools/pkg/aarch64/ /root/sync.sh

echo "Fix script manually first"
exit 1
## Workaround:
## sudo vim /usr/share/manjaro-arm-tools/lib/functions.sh
### add i to makepkg
###        pacman -U --noconfirm $PKGDIR/$ARCH/$PACKAGE*pkg.tar.xz

# apps
sudo buildarmpkg -p tut-git
sudo buildarmpkg -k -p cor-git

sudo buildarmpkg -k -p nemo-theme-glacier-git

sudo buildarmpkg -k -p qt5-quickcontrols-nemo-git

sudo buildarmpkg -k -p qt5-glacier-app-git

sudo buildarmpkg -k -p glacier-calc-git

sudo buildarmpkg -k -p nemo-qml-plugin-settings-git

sudo buildarmpkg -k -p glacier-camera-git

sudo buildarmpkg -k -p nemo-qml-plugin-folderlistmodel-git
sudo buildarmpkg -k -p glacier-filemuncher-git
sudo buildarmpkg -k -p meego-resource-git
sudo buildarmpkg -k -p qt5-resource-git
sudo buildarmpkg -k -p nemo-qml-plugin-thumbnailer-git
sudo buildarmpkg -k -p glacier-gallery-git
sudo buildarmpkg -k -p qt5-dbus-extended-git
sudo buildarmpkg -k -p qt5-mpris-git
sudo buildarmpkg -k -p glacier-music-git
# glacier-pinquery-git after qt5-ofono-git

# homescreen/de

sudo buildarmpkg -k -p mce-headers-git
sudo buildarmpkg -k -p libiphb-git
sudo buildarmpkg -k -p nemo-keepalive-git
sudo buildarmpkg -k -p nemo-qml-plugin-dbus-git
sudo buildarmpkg -k -p ssu-sysinfo-git
sudo buildarmpkg -k -p nemo-qml-plugin-devicelock-git
sudo buildarmpkg -k -p qt5-mlite-git
sudo buildarmpkg -k -p nemo-qml-plugin-configuration-git
sudo buildarmpkg -k -p nemo-qml-plugin-statusnotifier-git
sudo buildarmpkg -k -p qt5-iodata-git
sudo buildarmpkg -k -p sailfish-access-control-git
sudo buildarmpkg -k -p qt5-timed-git
sudo buildarmpkg -k -p nemo-qml-plugin-time-git
sudo buildarmpkg -k -p qt5-pim-git
sudo buildarmpkg -k -p qt5-mlocale-git
sudo buildarmpkg -k -p libngf-git
sudo buildarmpkg -k -p usb-moded-git
sudo buildarmpkg -k -p mce-git
sudo buildarmpkg -k -p qt5-mce-git
sudo buildarmpkg -k -p qt5-contacts-sqlite-extensions-git
sudo buildarmpkg -k -p qt5-contacts-git
sudo buildarmpkg -k -p nemo-qml-plugin-contacts-git
sudo buildarmpkg -k -p nemo-qml-plugin-notifications-git
sudo buildarmpkg -k -p qt5-ofono-git
sudo buildarmpkg -k -p glacier-pinquery-git # additional app
sudo buildarmpkg -k -p qt5-ofono-nemo-extensions-git
sudo buildarmpkg -k -p qt5-connman-git
sudo buildarmpkg -k -p nemo-qml-plugin-contentaction-git
sudo buildarmpkg -k -p qt5-ngfd-git
sudo buildarmpkg -k -p qt5-usb-moded-git
sudo buildarmpkg -k -p nemo-qml-plugin-models-git
sudo buildarmpkg -k -p libuser
sudo buildarmpkg -k -p sailfish-user-managerd-git
sudo buildarmpkg -k -p profiled-git
sudo buildarmpkg -k -p libsailfishkeyprovider-git
sudo buildarmpkg -k -p nemo-qml-plugin-systemsettings-git
sudo buildarmpkg -k -p qt5-lipstick-git
sudo buildarmpkg -k -p lipstick-glacier-home-git
sudo buildarmpkg -k -p glacier-wayland-session


# need to be clarified

sudo buildarmpkg -k -p qt5-profile-git
sudo buildarmpkg -k -p qt5-around-git
sudo buildarmpkg -k -p sailfish-access-control-qt5-git 
