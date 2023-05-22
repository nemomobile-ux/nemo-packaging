# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=mkcal
pkgver=0.7.19
pkgrel=1
pkgdesc="Telepathy <> QtContacts bridge for contacts"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/mkcal"
license=('BSD-3-Clause')
depends=('kcalendarcore' 'timed' 'qmf-qt5')
makedepends=('cmake' 'extra-cmake-modules')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b48331dc297f3e48b92e35f8abfb9bb72ef5a02614c0c1cde7f8fb6b55de2966')

build() {
    cd $pkgname-$pkgver
    cmake -DCMAKE_INSTALL_PREFIX:PATH='/usr' .
    make  all
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
