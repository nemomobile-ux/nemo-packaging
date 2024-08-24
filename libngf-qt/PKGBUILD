## $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=libngf-qt6
pkgver=0.8.7
pkgrel=1
pkgdesc="Qt-based client library for Non-Graphic Feedback daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/libngf-qt"
license=('GPL')
depends=('qt6-declarative' 'libngf' 'qt6-feedback')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('bb301ad2fa0895add1cc70285de97c61c04b9f9b8ce6bf2316ce5127872641ad')

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
