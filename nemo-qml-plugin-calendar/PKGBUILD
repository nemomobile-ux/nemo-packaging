## $Id$
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=nemo-qml-plugin-calendar
pkgver=0.7.4
pkgrel=1
pkgdesc="Calendar plugin for Nemo Mobile"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/$pkgname"
license=('BSD')
depends=('qt6-base'
    'libaccounts-qt6'
    'mkcal6'
    'kcalendarcore>=6.0'
    'qt6-declarative')
source=("${url}/archive/refs/tags/$pkgver.tar.gz"
    "0001-fix_with_qt6.patch")
sha256sums=('27fa9f1580bea43e4feafb6512a2979a67d5385ab5081a205ce1b446bc8a5655'
    'c0a4caf85cb2e8278e442ce75423f83e273f7230e4cff45d53dc5abbfb37d3d3')

prepare() {
    cd $pkgname-$pkgver
    patch -p1 --input="${srcdir}/0001-fix_with_qt6.patch"
}

build() {
    cd $pkgname-$pkgver
    qmake6
    make
}

package() {
    cd $pkgname-$pkgver
    make -j 1 INSTALL_ROOT="$pkgdir/" install
    rm -rf $pkgdir/opt
}
