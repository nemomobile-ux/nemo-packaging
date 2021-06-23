## $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

_host="github.com"
_project=neochapay
_basename=nemo-device-dont_be_evil
_branch=master

_gitname=$_basename
pkgname=nemo-device-pinephone

pkgver=0.4.2
pkgrel=1
pkgdesc="PinePhone specific files for GlacierUX"
arch=('aarch64')
url="https://$_host/$_project/$_gitname#branch=$_branch"
license=('BSD-3-Clause')
depends=('glacier-wayland-session' 'usb-moded' 'maliit-nemo-keyboard' 'sensorfw')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "usb-tethering")
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

package() {
    sed -r "s/0.9/${pkgver}/" ${srcdir}/nemo-device-pinephone/sparse/etc/hw-release

    mkdir -p ${pkgdir}/var/lib/environment/compositor/
    mkdir -p ${pkgdir}/etc/mce
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/lib/systemd/system/basic.target.wants

    cp ${srcdir}/nemo-device-pinephone/sparse/etc/eglfs-config.json ${pkgdir}/etc/
    sed -r "s/0.9/${pkgver}/" ${srcdir}/nemo-device-pinephone/sparse/etc/hw-release > ${pkgdir}/etc/hw-release

    cp -r ${srcdir}/nemo-device-pinephone/sparse/etc/mce ${pkgdir}/etc/
    cp -r ${srcdir}/nemo-device-pinephone/sparse/etc/sensorfw ${pkgdir}/etc/
    cp -r ${srcdir}/nemo-device-pinephone/sparse/etc/usb-moded ${pkgdir}/etc/

    cp ${srcdir}/nemo-device-pinephone/sparse/lib/systemd/system/setup-configfs.service ${pkgdir}/usr/lib/systemd/system/
    ln -s ../setup-configfs.service ${pkgdir}/usr/lib/systemd/system/basic.target.wants
    cp ${srcdir}/nemo-device-pinephone/sparse/usr/bin/setup-configfs.sh ${pkgdir}/usr/bin
    
    cp ${srcdir}/nemo-device-pinephone/sparse/var/lib/environment/compositor/* ${pkgdir}/var/lib/environment/compositor/
}
