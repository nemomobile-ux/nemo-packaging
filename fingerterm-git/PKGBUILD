# $Id$

pkgname=fingerterm-git

pkgver=1.4.3.r0.g7e52271

pkgrel=1
pkgdesc="fingerterm is a terminal emulator designed for touch-based interaction, specifically for (but not limited to) use on the Nokia N9 and Jolla's Jolla device."
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/fingerterm"
license=('BSD-3-Clause' 'LGPL-2.1-only')
depends=('qt5-declarative')
makedepends=('git' 'qt5-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ) 2>/dev/null
}

build() {
    cd "$srcdir/${pkgname}"
    qmake-qt5
    make
}

package() {
    cd "$srcdir/${pkgname}"
    make -j 1 INSTALL_ROOT="$pkgdir/" install
}
