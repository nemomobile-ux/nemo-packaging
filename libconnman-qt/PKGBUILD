# $Id$
# Contributor: Donald Carr<sirspudd@gmail.com>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=libconnman-qt
pkgver=1.3.5
pkgrel=1
pkgdesc='Qt Quick wrappers for connman'
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/libconnman-qt"
license=('GPL')
depends=('qt6-declarative' 'connman')
makedepends=('qt6-tools')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c07d31e202ee7cdf4687bcaf40aa40e05793b0a40401be8b8e580259cd738da3')

build() {
    cd $pkgname-$pkgver
    qmake6 -r VERSION=${pkgver}
    make
}

package() {
    cd $pkgname-$pkgver
    make -j 1 INSTALL_ROOT="$pkgdir" install 
}
