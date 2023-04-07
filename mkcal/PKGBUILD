# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=mkcal
pkgver=0.7.14
pkgrel=1
pkgdesc="Telepathy <> QtContacts bridge for contacts"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/mkcal"
license=('BSD-3-Clause')
depends=('kcalendarcore' 'timed' 'qmf-qt5')
makedepends=('cmake' 'extra-cmake-modules')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('cde3ba8efdac4500c595f00d53194f74cef1671c91f993b22529ee9c5ac9b710')

build() {
    cd $pkgname-$pkgver
    cmake -DCMAKE_INSTALL_PREFIX:PATH='/usr' .
    make  all
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
