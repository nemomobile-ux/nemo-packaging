# $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

_basename=ngfd-plugin-droid-vibrator
pkgname=ngfd-plugin-native-vibrator

pkgver=1.4.0
pkgrel=1
pkgdesc="Vibrator native plugin for ngfd"
arch=('x86_64' 'aarch64')
url="https://github.com/mer-hybris/ngfd-plugin-droid-vibrator"
license=('LGPL-2.1')
depends=('ngfd')
makedepends=('cmake' 'glib2')
conflicts=("ngfd-plugin-droid-vibrator")
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ecc89eb8e12f0fd53548a86ddf6aebfe64bb8e8951e8c43333f51453042b02c2')

build() {
    cd $_basename-$pkgver
    cmake \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DNATIVE_VIBRATOR=ON .
    make  all
}

package() {
    cd $_basename-$pkgver
    make DESTDIR="$pkgdir" install
}
