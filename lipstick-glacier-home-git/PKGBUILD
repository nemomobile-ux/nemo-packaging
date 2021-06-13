## $Id$
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=lipstick-glacier-home-git
_host="github.com"
_project=nemomobile-ux
_branch=master
pkgver=0.32.r7.g8186a12
pkgrel=1
pkgdesc="A nice homescreen for Glacier experience"
arch=('x86_64' 'aarch64')
url="https://$_host/$_project/glacier-home"
license=('BSD-3-Clause AND MIT')
depends=('bluez-qt' 'qt5-graphicaleffects' 'qt5-multimedia' 'qt5-feedback' 'qt5-mpris-git' 'qt5-lipstick-git' 'qt5-quickcontrols-nemo-git' 'nemo-qml-plugin-configuration-git' 'nemo-qml-plugin-statusnotifier-git' 'nemo-qml-plugin-time-git' 'nemo-qml-plugin-contacts-git' 'nemo-qml-plugin-notifications-git' 'qt5-ofono-nemo-extensions-git' 'nemo-qml-plugin-connectivity-git' 'glacier-settings-git' 'mapplauncherd-git')
makedepends=('git' 'extra-cmake-modules' 'qt5-wayland' 'qt5-tools' 'nemo-qml-plugin-devicelock' 'bluez-qt')
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ) 2>/dev/null
}

prepare() {
    cd "${srcdir}/${pkgname}"
}

build() {
  cd "${srcdir}/${pkgname}"
  cmake -B build \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc
  make -C build
}

package() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="$pkgdir" make -C build install
}
 
