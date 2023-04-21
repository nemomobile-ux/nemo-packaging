# $Id$
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>


pkgname=libqofonoext
pkgver=1.0.30
pkgrel=1
pkgdesc="A Qt library for accessing nemomobile specific ofono extensions"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/libqofonoext"
license=('LGPL-2.1-only')
depends=('libqofono-qt5>=0.101')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f971732a80263cf05c8e85c37eac22b0ef2d10cc10b48bafdce0f3dd7440a25e')

build() {
    cd $pkgname-$pkgver
    qmake
    make
}

package() {
    cd $pkgname-$pkgver
    make -j 1 INSTALL_ROOT="$pkgdir/" install
}
