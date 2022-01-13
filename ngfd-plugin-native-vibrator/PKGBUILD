# $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

_host="github.com"
_project=mer-hybris
_basename=ngfd-plugin-droid-vibrator

_gitname=$_basename
pkgname=ngfd-plugin-native-vibrator

pkgver=1.3.1
pkgrel=1
pkgdesc="Vibrator native plugin for ngfd"
arch=('x86_64' 'aarch64')
url="https://$_host/$_project/$_gitname"
license=('LGPL-2.1')
depends=('ngfd')
makedepends=('cmake' 'glib2')
conflicts=("ngfd-plugin-droid-vibrator")
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c6fce10044f3a3dc10b59759ded2b9bc857167a8da8ba3ca83c4c99dfd2d33b7')

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
