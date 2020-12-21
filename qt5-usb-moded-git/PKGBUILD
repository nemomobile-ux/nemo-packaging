## $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=qt5-usb-moded-git
_pkgname=libusb-moded-qt-git
pkgver=1.9.r0.g0544b73
pkgrel=1
pkgdesc="A library of Qt5 bindings for usb_moded"
arch=('x86_64' 'aarch64')
url="https://git.sailfishos.org/mer-core/libusb-moded-qt"
license=('BSD-2-Clause')
depends=('qt5-base' 'usb-moded')
makedepends=('git')
provides=("${_pkgname%-git}" "${pkgname%-git}")
conflicts=("${_pkgname%-git}" "${pkgname%-git}")
source=('git+https://git.sailfishos.org/mer-core/libusb-moded-qt.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${_pkgname%-git}"
    qmake-qt5 PREFIX=/usr
    make
}

package() {
    cd "$srcdir/${_pkgname%-git}"
    make INSTALL_ROOT="$pkgdir/" install
}
