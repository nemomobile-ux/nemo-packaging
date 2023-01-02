# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=mkcal
pkgver=0.7.1
pkgrel=1
pkgdesc="Telepathy <> QtContacts bridge for contacts"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/mkcal"
license=('BSD-3-Clause')
depends=('kcalendarcore' 'timed' 'qmf-qt5')
makedepends=('cmake' 'extra-cmake-modules')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('43ca2ed9b03404f22a3863a54961d8416fb0836a71e37624afecbac3903371e4')

build() {
    cd $pkgname-$pkgver
    cmake -DCMAKE_INSTALL_PREFIX:PATH='/usr' .
    make  all
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
