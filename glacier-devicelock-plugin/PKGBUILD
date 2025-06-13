# $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=glacier-devicelock-plugin
pkgver=0.4
pkgrel=1
pkgdesc="Glacier devicelock plugin"
arch=('x86_64' 'aarch64')
url="https://github.com/nemomobile-ux/glacier-devicelock-plugin"
license=('LGPL-2.1')
depends=('nemo-qml-plugin-devicelock')
makedepends=('cmake' 'glib2' 'qt6-tools' 'clang')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('798241d6f57a4711501b67b0b6e183d85ebe86bdd8b1907205610fc1a70e7d64')

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
