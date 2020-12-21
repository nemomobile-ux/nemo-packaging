# $Id$
# Maintainer: TheKit <nekit1000 at gmail.com>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=libngf-git
pkgver=0.27.r0.g30f7d6a
pkgrel=1
pkgdesc="Non-graphic feedback C-based client library"
arch=('x86_64' 'aarch64')
url="https://git.sailfishos.org/mer-core/libngf"
license=('GPL')
depends=('dbus-glib')
makedepends=('git' 'check')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://git.sailfishos.org/mer-core/libngf.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
    ./autogen.sh
    ./configure --prefix=/usr
	make
	doxygen doc/doxygen.cfg
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
	install -d $pkgdir/usr/share/doc/libngf-doc/html/
    install -m 644 doc/html/* $pkgdir/usr/share/doc/libngf-doc/html/
}
