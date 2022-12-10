# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=mkcal
pkgver=0.6.11
pkgrel=1
pkgdesc="Telepathy <> QtContacts bridge for contacts"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/mkcal"
license=('BSD-3-Clause')
depends=('kcalendarcore' 'timed' 'qmf-qt5')
makedepends=('cmake' 'extra-cmake-modules')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a68c718c57d4dd95d5bd1a81ad52701b0b069faf93c771345eece56d559241e6')

build() {
    cd $pkgname-$pkgver
    cmake -DCMAKE_INSTALL_PREFIX:PATH='/usr' .
    make  all
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
