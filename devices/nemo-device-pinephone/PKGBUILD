## $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

_host="github.com"
_project=neochapay
_basename=nemo-device-dont_be_evil
_branch=master

_gitname=$_basename
pkgname=nemo-device-pinephone

pkgver=0.6
pkgrel=1
pkgdesc="PinePhone specific files for GlacierUX"
arch=('aarch64')
url="https://$_host/$_project/$_gitname#branch=$_branch"
license=('BSD-3-Clause')
depends=('glacier-wayland-session' 
	'usb-moded' 
	'maliit-nemo-keyboard' 
	'sensorfw'
	'ofono'
	'ofonoctl'
	'libqofono-qt5'
	'glacier-dialer-git'
	'glacier-pinquery-git'
	'qt5-sensors-sensorfw'
	'qt-mobility-haptics-ffmemless-git')

makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "usb-tethering")
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

package() {
    mkdir -p ${pkgdir}

    cp -r ${srcdir}/nemo-device-pinephone/sparse/* ${pkgdir}/
    sed -r "s/NEMOVER/${pkgver}/" ${srcdir}/nemo-device-pinephone/sparse/etc/hw-release > ${pkgdir}/etc/hw-release
}
