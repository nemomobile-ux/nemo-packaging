## $Id$
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=nemo-qml-plugin-calendar
pkgver=0.6.47
pkgrel=1
pkgdesc="Calendar plugin for Nemo Mobile"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/$pkgname"
license=('BSD')
depends=('qt5-base'
    'libaccounts-qt'
    'mkcal'
    'kcalendarcore')

source=("${url}/archive/refs/tags/$pkgver.tar.gz"
    "0001-disable_werror.patch")
sha256sums=('3fc4195675b6e65603f99693121b5c54eb73acbd4c527b6c6121397d6c8f678c'
    '5497ca6cf4dc9dad821ae4b0614da789c92efcb74837dc99a006938aaa6bfc36')

prepare() {
    cd $pkgname-$pkgver
    patch -p1 --input="${srcdir}/0001-disable_werror.patch"
}

build() {
    cd $pkgname-$pkgver
    qmake
    make
}

package() {
    cd $pkgname-$pkgver
    make -j 1 INSTALL_ROOT="$pkgdir/" install
    rm -rf $pkgdir/opt
}
