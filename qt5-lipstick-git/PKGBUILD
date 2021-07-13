## $Id$
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=qt5-lipstick-git
_srcname=qt5-lipstick
_project=neochapay # mer-core fork
_branch=master
pkgver=0.40
pkgrel=2
pkgdesc="QML toolkit for homescreen creation"
arch=('x86_64' 'aarch64')
url="https://github.com/neochapay/lipstick-1.git"
license=('LGPL-2.1-only')
depends=('qt5-sensors' 'qt5-wayland' 'nemo-keepalive-git' 'qt5-resource-git' 'libsystemd' 'mce-headers-git' 'qt5-mce-git' 'qt5-ngfd-git' 'nemo-qml-plugin-devicelock-git' 'nemo-qml-plugin-systemsettings-git')
makedepends=('git' 'qt5-tools' 'doxygen' 'graphviz')
optdepends=()
provides=("${_srcname}")
conflicts=()
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')


prepare() {
    cd "${srcdir}/${pkgname}"
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir -p build
  cd build
  qmake ..
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  cd build
  make -j 1 INSTALL_ROOT="${pkgdir}" install
}
 
