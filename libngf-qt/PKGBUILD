## $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=libngf-qt
pkgver=0.8.4
pkgrel=1
pkgdesc="Qt-based client library for Non-Graphic Feedback daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/libngf-qt"
license=('GPL')
depends=('qt5-declarative' 'libngf' 'qt5-feedback')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('cfac32f032cdcd510e259c2a4d971847657d633b506024b0a03b297fce490569')


build() {
    cd $pkgname-$pkgver
    qmake PREFIX=/usr "VERSION=$(sed 's/+.*//' <<<"${pkgver}")"

    # Hack for PREFIX path not being passed to src subproject for some reason
    cd src
    qmake PREFIX=/usr
    cd ..

    make
}

package() {
    cd $pkgname-$pkgver
    make -j 1 INSTALL_ROOT="$pkgdir/" install
    # Remove tests
    rm -rf "$pkgdir/opt"
}
