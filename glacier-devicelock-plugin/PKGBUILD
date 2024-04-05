# $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=glacier-devicelock-plugin
pkgver=0.3
pkgrel=1
pkgdesc="Glacier devicelock plugin"
arch=('x86_64' 'aarch64')
url="https://github.com/nemomobile-ux/glacier-devicelock-plugin"
license=('LGPL-2.1')
depends=('nemo-qml-plugin-devicelock')
makedepends=('cmake' 'glib2' 'qt6-tools')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('81a8f33397c7b10aed907797637a93a7b7e29d00826b85c918a133a1827ba0aa')

build() {
    cmake \
        -B "${pkgname}-${pkgver}/build" \
        -S "${pkgname}-${pkgver}" \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr'
    make -C "${pkgname}-${pkgver}/build" all
}

package() {
    make -C "${srcdir}/${pkgname}-${pkgver}/build" DESTDIR="$pkgdir" install
}
