## $Id$
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=nemo-qml-plugin-calendar
pkgver=0.7.2
pkgrel=1
pkgdesc="Calendar plugin for Nemo Mobile"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/$pkgname"
license=('BSD')
depends=('qt6-base'
    'libaccounts-qt6'
    'mkcal'
    'kcalendarcore6')

source=("${url}/archive/refs/tags/$pkgver.tar.gz"
    "0001-disable_werror.patch"
)
sha256sums=('7768a35b7a99a63c106b9820829f8aec7f98e36d2fd4d5bb26c6d09e089013f3'
    '5497ca6cf4dc9dad821ae4b0614da789c92efcb74837dc99a006938aaa6bfc36'
)

prepare() {
    cd $pkgname-$pkgver
    patch -p1 --input="${srcdir}/0001-disable_werror.patch"
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
