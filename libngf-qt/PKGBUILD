## $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=libngf-qt
pkgver=0.8.2
pkgrel=1
pkgdesc="Qt-based client library for Non-Graphic Feedback daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/libngf-qt"
license=('GPL')
depends=('qt5-declarative' 'libngf' 'qt5-feedback')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e18b3b05f30fe58d7c272df18b07559d1ca479879ad1778cf51db6b60f812126')


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
