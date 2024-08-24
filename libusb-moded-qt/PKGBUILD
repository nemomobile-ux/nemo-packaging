## $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=libusb-moded-qt
pkgver=1.13
pkgrel=1
pkgdesc="A library of qt6 bindings for usb_moded"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/libusb-moded-qt"
license=('BSD-2-Clause')
depends=('qt6-base' 'usb-moded')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f9cb3540f3b12c1f1a7717e815a9f8d5ee258a376d9611c8c4af1e5ecd27cb70')

build() {
    cd $pkgname-$pkgver
    qmake6 PREFIX=/usr VERSION=${pkgver}
    make
}

package() {
    cd $pkgname-$pkgver
    make -j 1 INSTALL_ROOT="$pkgdir/" install
}
