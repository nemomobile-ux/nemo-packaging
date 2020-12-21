# $Id$
# Maintainer: TheKit <nekit1000 at gmail.com>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=mce-headers-git
pkgver=1.28.0.r0.g4156ad4
pkgrel=1
pkgdesc="Development files for mce"
arch=('x86_64' 'aarch64')
url="https://git.sailfishos.org/mer-core/mce-dev"
license=('GPL')
makedepends=('git' 'doxygen')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://git.sailfishos.org/mer-core/mce-dev.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/mce-dev"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/mce-dev"
	make
	make doc
}

package() {
	cd "$srcdir/mce-dev"
	make DESTDIR="$pkgdir/" install
	install -d $pkgdir/usr/share/doc/mce-doc/html/
	install -m 644 doc/html/* $pkgdir/usr/share/doc/mce-doc/html/
}
