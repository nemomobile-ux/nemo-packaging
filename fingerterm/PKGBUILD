# $Id$
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=fingerterm
pkgver=1.4.7
pkgrel=1
pkgdesc="fingerterm is a terminal emulator designed for touch-based interaction, specifically for (but not limited to) use on the Nokia N9 and Jolla's Jolla device."
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/fingerterm"
license=('BSD-3-Clause' 'LGPL-2.1-only')
depends=('qt6-declarative' 'qt6-5compat')
makedepends=('qt6-tools' 'clang')
source=("${url}/archive/refs/tags/$pkgver.tar.gz"
  '0001-use-lupdate-and-lrelease-from-QT_INSTALL_BINS.patch'
  '0002-Qt6-compatibility.patch'
  '0003-Changes-needed-for-qt6.patch'
)
sha256sums=('7f9bd9689141a927a066f0ba85055dc41f48298d21e3430b36b2d02010a610be'
    'e7c3961e778faaeb3081aee321b2a5bf8edcd42eddec96e18b42e0bddaa2cab0'
    '76700a10d0507fe4b441b36f8709a8bd13e18670c08a7a58592835cfb435f126'
    '205ce057eb4900ab2bf7fc9246e0dc8244ad76f2e910c4f17a3e45c2a133cc1a'
)

prepare() {
    cd $pkgname-$pkgver
    patch -p1 --input="${srcdir}/0001-use-lupdate-and-lrelease-from-QT_INSTALL_BINS.patch"
    patch -p1 --input="${srcdir}/0002-Qt6-compatibility.patch"
    patch -p1 --input="${srcdir}/0003-Changes-needed-for-qt6.patch"
}

build() {
    cd $pkgname-$pkgver
    qmake6
    make
}

package() {
    cd $pkgname-$pkgver
    make -j 1 INSTALL_ROOT="$pkgdir/" install
}
