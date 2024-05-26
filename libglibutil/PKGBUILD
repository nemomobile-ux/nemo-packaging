# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=libglibutil
pkgver=1.0.79
pkgrel=1
pkgdesc="Library of glib utilities"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/${pkgname}"
license=('LGPLv2')
depends=('glib2')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('4d689cb79f8ea061e46b89008370dc771b07164ee496850d9d56d9d85f1be1c3')

build() {
    cd $pkgname-$pkgver
    make LIBDIR=/usr/lib KEEP_SYMBOLS=1 release pkgconfig
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir/" LIBDIR=/usr/lib install-dev
}
