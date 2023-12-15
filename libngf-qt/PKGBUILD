## $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=libngf-qt6
pkgver=0.8.6
pkgrel=1
pkgdesc="Qt-based client library for Non-Graphic Feedback daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/libngf-qt"
license=('GPL')
depends=('qt6-declarative' 'libngf' 'qt6-feedback')
source=("${url}/archive/refs/tags/$pkgver.tar.gz"
    "0001-fix_build_with_qt6.patch")
sha256sums=('e51e33a1875eb69c0cbcc59dad5c20b99bbadd4c998b4dd64da4a4dde69267e8'
    '8e90974568fa70110d38b8c2da597acf5eab22388ed3dc588a097c04843c019b')

prepare() {
    cd libngf-qt-$pkgver
    patch -Np1 -i "${srcdir}/0001-fix_build_with_qt6.patch"
}

build() {
    cd libngf-qt-$pkgver
    qmake6 PREFIX=/usr "VERSION=$(sed 's/+.*//' <<<"${pkgver}")"

    # Hack for PREFIX path not being passed to src subproject for some reason
    cd src
    qmake6 PREFIX=/usr
    cd ..

    make
}

package() {
    cd libngf-qt-$pkgver
    make -j 1 INSTALL_ROOT="$pkgdir/" install
    # Remove tests
    rm -rf "$pkgdir/opt"
}
