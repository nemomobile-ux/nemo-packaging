## $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=libusb-moded-qt
pkgver=1.11
pkgrel=2
pkgdesc="A library of qt6 bindings for usb_moded"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/libusb-moded-qt"
license=('BSD-2-Clause')
depends=('qt6-base' 'usb-moded')
source=("${url}/archive/refs/tags/$pkgver.tar.gz"
    '0001-qt6.patch'
)
sha256sums=('0af17dbb23dfec10133e9e734322cc8399bedfc45166437f91cd955674819db2'
    'b7c884b36070f181a07ce7d85d8e88075742dfd354bf4dff4242b8430cc3075d'
)

prepare() {
  cd $pkgname-$pkgver
  patch -p1 --input="${srcdir}/0001-qt6.patch"
}

build() {
    cd $pkgname-$pkgver
    qmake6 PREFIX=/usr VERSION=${pkgver}
    make
}

package() {
    cd $pkgname-$pkgver
    make -j 1 INSTALL_ROOT="$pkgdir/" install
}
