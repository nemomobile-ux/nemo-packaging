## $Id$
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=qt5-lipstick-git
_srcname=qt5-lipstick
_project=neochapay # mer-core fork
_branch=jb42170_qt5.12
pkgver=0.34.16.r11.g0d4d35bd
pkgrel=1
pkgdesc="QML toolkit for homescreen creation"
arch=('x86_64' 'aarch64')
url="https://git.sailfishos.org/$_project/lipstick#branch=$_branch"
license=('LGPL-2.1-only')
depends=('qt5-sensors' 'qt5-wayland' 'nemo-keepalive-git' 'qt5-resource-git' 'libsystemd' 'nemo-qml-plugin-contentaction-git' 'mce-headers-git' 'qt5-ngfd-git' 'nemo-qml-plugin-devicelock-git' 'nemo-qml-plugin-systemsettings-git')
makedepends=('git' 'qt5-tools' 'doxygen' 'graphviz')
optdepends=()
provides=("${_srcname}")
conflicts=()
source=("${pkgname}::git+${url}" "update-plugin-registertypes-to-qt5.14.patch")
sha256sums=('SKIP' 'fbfb364e8f808f05bd923553de735e92f5a908c3a62b4be71d84d32b899d8176')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ) 2>/dev/null
}

prepare() {
    cd "${srcdir}/${pkgname}"
    patch -p1 --input="${srcdir}/update-plugin-registertypes-to-qt5.14.patch"
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
  make INSTALL_ROOT="${pkgdir}" install
}
 
