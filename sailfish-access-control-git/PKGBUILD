# $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=sailfish-access-control-git
_pkgname=sailfish-access-control
pkgver=0.0.4.r0.gc5e30f2
pkgrel=1
pkgdesc="Sailfish Access Control library"
arch=('x86_64' 'aarch64')
url="https://git.sailfishos.org/mer-core/sailfish-access-control"
license=('GPL')
depends=('glib2')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://git.sailfishos.org/mer-core/sailfish-access-control.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${_pkgname%-git}/glib"
	make
}

package() {
	cd "$srcdir/${_pkgname%-git}/glib"
	make ROOT="$pkgdir/" install-libsailfishaccesscontrol
	make ROOT="$pkgdir/" install-libsailfishaccesscontrol-dev
}
