# $Id$
# Contributor: Donald Carr<sirspudd@gmail.com>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=libconnman-qt
pkgver=1.3.9
pkgrel=1
pkgdesc='Qt Quick wrappers for connman'
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/libconnman-qt"
license=('GPL')
depends=('qt6-declarative' 'connman')
makedepends=('qt6-tools')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('df40fa694abc02354dd74d7a378a6639181525755a0eacb978f1b1a6c9a5b5c0')

build() {
    cd $pkgname-$pkgver
    qmake6 -r VERSION=${pkgver}
    make
}

package() {
    cd $pkgname-$pkgver
    make -j 1 INSTALL_ROOT="$pkgdir" install 
}
