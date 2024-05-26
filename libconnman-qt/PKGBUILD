# $Id$
# Contributor: Donald Carr<sirspudd@gmail.com>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=libconnman-qt
pkgver=1.4.6
pkgrel=1
pkgdesc='Qt Quick wrappers for connman'
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/libconnman-qt"
license=('GPL')
depends=('qt6-declarative' 'connman')
makedepends=('qt6-tools')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('6e42510ed74bbbedf1a6c457de221640558e15a1cb1bf94dad76a7f2e2148465')

build() {
    cd $pkgname-$pkgver
    qmake6 -r VERSION=${pkgver}
    make
}

package() {
    cd $pkgname-$pkgver
    make -j 1 INSTALL_ROOT="$pkgdir" install 
}
