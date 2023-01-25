# $Id$
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=fingerterm
pkgver=1.4.7
pkgrel=1
pkgdesc="fingerterm is a terminal emulator designed for touch-based interaction, specifically for (but not limited to) use on the Nokia N9 and Jolla's Jolla device."
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/fingerterm"
license=('BSD-3-Clause' 'LGPL-2.1-only')
depends=('qt5-declarative')
makedepends=('qt5-tools')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7f9bd9689141a927a066f0ba85055dc41f48298d21e3430b36b2d02010a610be')

build() {
    cd $pkgname-$pkgver
    qmake-qt5
    make
}

package() {
    cd $pkgname-$pkgver
    make -j 1 INSTALL_ROOT="$pkgdir/" install
}
