# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>
_gitname=mkcal
pkgname=mkcal6
pkgver=1.7.26
pkgrel=1
pkgdesc="SQlite storage backend for KCalendarCore"
arch=('x86_64' 'aarch64')
url="https://github.com/neochapay/${_gitname}"
license=('BSD-3-Clause')
depends=('kcalendarcore>=6.0' 'timed')
makedepends=('cmake' 'extra-cmake-modules>=6.0')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('56ab07544453fcfe8374382bd74ee19ce1682f94883f79a883af5f59ebb0a10e')

build() {
    cd ${_gitname}-$pkgver
    cmake -DCMAKE_INSTALL_PREFIX:PATH='/usr' .
    make  all
}

package() {
    cd ${_gitname}-$pkgver
    make DESTDIR="$pkgdir" install
}
