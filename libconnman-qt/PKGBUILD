# $Id$
# Contributor: Donald Carr<sirspudd@gmail.com>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=libconnman-qt
pkgver=1.2.46
pkgrel=1
pkgdesc='Qt Quick wrappers for connman'
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/libconnman-qt"
license=('GPL')
depends=('qt5-declarative' 'connman')
makedepends=('qt5-tools')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c38a935a99f8e548c7012b0e91a465f6127e3c400e8bc59c7f6f1683d524e26c')

build() {
    cd $pkgname-$pkgver
    qmake -r VERSION=${pkgver}
    make
}

package() {
    cd $pkgname-$pkgver
    make -j 1 INSTALL_ROOT="$pkgdir" install 
}
