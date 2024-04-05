# $Id$
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>


pkgname=libqofonoext
pkgver=1.0.32
pkgrel=1
pkgdesc="A Qt library for accessing nemomobile specific ofono extensions"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/libqofonoext"
license=('LGPL-2.1-only')
depends=('libqofono-qt6>=0.101')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d46bc31a6e554ff7c03466b7e89c31c29fa11077cb237b5630ff901a4e0d153e')

build() {
    cd $pkgname-$pkgver
    qmake6
    make
}

package() {
    cd $pkgname-$pkgver
    make -j 1 INSTALL_ROOT="$pkgdir/" install
}
