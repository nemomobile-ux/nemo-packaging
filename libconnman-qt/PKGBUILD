# $Id$
# Contributor: Donald Carr<sirspudd@gmail.com>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=libconnman-qt
pkgver=1.4.0
pkgrel=1
pkgdesc='Qt Quick wrappers for connman'
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/libconnman-qt"
license=('GPL')
depends=('qt6-declarative' 'connman')
makedepends=('qt6-tools')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d51bf7d01c082706930b40f18726eca5301c4a7fe8f244716c0b87709091efc2')

build() {
    cd $pkgname-$pkgver
    qmake6 -r VERSION=${pkgver}
    make
}

package() {
    cd $pkgname-$pkgver
    make -j 1 INSTALL_ROOT="$pkgdir" install 
}
