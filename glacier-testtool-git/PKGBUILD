# $Id$

pkgname=glacier-testtool-git

pkgver=0.1.r34.g11db387

pkgrel=1
pkgdesc="Nemo hardware tester"
arch=('x86_64' 'aarch64')
url="https://github.com/nemomobile-ux/glacier-testtool"
license=('BSD-3-Clause' 'LGPL-2.1-only')
depends=('qt5-glacier-app-git' 'qt5-sensors-sensorfw' 'qt5-charts')
makedepends=('git' 'cmake' 'qt5-tools')
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
    cmake \
        -B "${pkgname}/build" \
        -S "${pkgname}" \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr'
    make -C "${pkgname}/build" all
}

package() {
    make -C "${srcdir}/${pkgname}/build" DESTDIR="$pkgdir" install
}
