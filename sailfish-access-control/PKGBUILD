# $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=sailfish-access-control
pkgver=0.0.7
pkgrel=1
pkgdesc="Sailfish Access Control library"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/sailfish-access-control"
license=('GPL')
depends=('glib2')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('16da68e4ae925ff3e9454b7d4242455ea1e1d9aa99002c861a8054a7bc061db2')

build() {
	cd $pkgname-$pkgver/glib
	make LIBDIR=/usr/lib ROOT="$pkgdir/" VERSION=${pkgver}
	make LIBDIR=/usr/lib ROOT="$pkgdir/" VERSION=${pkgver} sailfishaccesscontrol.pc
}

package() {
	cd $pkgname-$pkgver/glib
	make ROOT="$pkgdir/" install-libsailfishaccesscontrol
	make ROOT="$pkgdir/" install-libsailfishaccesscontrol-dev
}
