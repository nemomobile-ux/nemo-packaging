# $Id$
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=qtcontacts-sqlite
pkgver=0.3.19
pkgrel=1
pkgdesc="SQLite-based plugin for QtPIM Contacts"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/qtcontacts-sqlite"
license=('BSD-3-Clause')
depends=('qt6-pim' 'mlite')
source=("${url}/archive/refs/tags/$pkgver.tar.gz"
    "0001-fix_build_with_qt6.patch")
sha256sums=('4c8b2b4120cb501e4e00dc3f3ab40b7620c8800ef72338a3b5ba0255f9fc2088'
    '27ba678b69877c6a741f55b4170906750019ae281f8f29a539e824d79202bb85')

prepare() {
    cd $pkgname-$pkgver
    patch -p1 --input="${srcdir}/0001-fix_build_with_qt6.patch"
}

build() {
    cd $pkgname-$pkgver
    qmake6 PREFIX=/usr "VERSION=${pkgver}"
    make
}


package() {
    cd $pkgname-$pkgver
    make -j 1 INSTALL_ROOT="$pkgdir/" install
    rm -rf $pkgdir/opt
}
