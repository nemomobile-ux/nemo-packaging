# $Id$
# Maintainer: TheKit <nekit1000 at gmail.com>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=cor-git
pkgver=0.1.20.r0.g505408a
pkgrel=1
pkgdesc="another C++/C library. Contains useful utilities which are not a part of any other library"
arch=('x86_64' 'aarch64')
url="https://git.sailfishos.org/mer-core/cor"
license=('GPL')
depends=('systemd-libs')
makedepends=('git' 'cmake' 'check' 'tut')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://git.sailfishos.org/mer-core/cor.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DVERSION=$pkgver
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
        # Remove tests
        rm -rf "$pkgdir"/opt
}
 
