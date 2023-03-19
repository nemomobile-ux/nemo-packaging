# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=mkcal
pkgver=0.7.13
pkgrel=1
pkgdesc="Telepathy <> QtContacts bridge for contacts"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/mkcal"
license=('BSD-3-Clause')
depends=('kcalendarcore' 'timed' 'qmf-qt5')
makedepends=('cmake' 'extra-cmake-modules')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a472d40327cd08b27abace2ab031e8c5dae04d72b594b4c6dc2d73b24bc3f5df')

build() {
    cd $pkgname-$pkgver
    cmake -DCMAKE_INSTALL_PREFIX:PATH='/usr' .
    make  all
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
