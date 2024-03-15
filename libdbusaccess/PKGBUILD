# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=libdbusaccess
pkgver=1.0.20
pkgrel=1
pkgdesc="Access control over D-Bus"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/${pkgname}"
license=('LGPLv2')
depends=('glib2' 'libglibutil')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1e37ecd9e40304a23b5fc7ae71b0d7424e88ff348287b31a411f6f462c80e3ed')

build() {
    cd $pkgname-$pkgver
    make -j1 LIBDIR=/usr/lib KEEP_SYMBOLS=1 release pkgconfig
    make -j1
}

package() {
    cd $pkgname-$pkgver
    make -j1 DESTDIR="$pkgdir/" LIBDIR=/usr/lib install-dev
}
