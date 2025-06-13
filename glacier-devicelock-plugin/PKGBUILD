# $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=glacier-devicelock-plugin
pkgver=0.5.1
pkgrel=1
pkgdesc="Glacier devicelock plugin"
arch=('x86_64' 'aarch64')
url="https://github.com/nemomobile-ux/glacier-devicelock-plugin"
license=('LGPL-2.1')
depends=('nemo-qml-plugin-devicelock')
makedepends=('cmake' 'glib2' 'qt6-tools' 'clang')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('04075ca19c463f43d4e5c2e10cc177a98843004489baa5ba2a4d1eb032824a81')

build() {
    cmake \
        -B "${pkgname}-${pkgver}/build" \
        -S "${pkgname}-${pkgver}" \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr'
    make -C "${pkgname}-${pkgver}/build" all
}

check() {
    make -C "${pkgname}-${pkgver}/build" test
}

package() {
    make -C "${srcdir}/${pkgname}-${pkgver}/build" DESTDIR="$pkgdir" install
}
