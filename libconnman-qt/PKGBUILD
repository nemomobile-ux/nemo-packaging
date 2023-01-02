# $Id$
# Contributor: Donald Carr<sirspudd@gmail.com>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=libconnman-qt
pkgver=1.3.0
pkgrel=1
pkgdesc='Qt Quick wrappers for connman'
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/libconnman-qt"
license=('GPL')
depends=('qt5-declarative' 'connman')
makedepends=('qt5-tools')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('e32035966726ca4731d3b75b31d0dd3ca77d19f6e267f8832287055d4b911bd7')

build() {
    cd $pkgname-$pkgver
    qmake -r VERSION=${pkgver}
    make
}

package() {
    cd $pkgname-$pkgver
    make -j 1 INSTALL_ROOT="$pkgdir" install 
}
