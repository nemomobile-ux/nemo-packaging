# $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=libiphb
pkgver=1.2.7
pkgrel=1
pkgdesc="C API for using IP Heartbeat service"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/libiphb"
license=('LGPL-2.1-or-later')
depends=('dbus-glib' 'libdsme')
makedepends=('mce-headers' 'git')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('94a3db9bc154a60982b5bbc46343812cc4dabb499d37690c325015516f790a7d')

prepare() {
	cd $pkgname-$pkgver
	rm -rf dbus-gmain
	git clone https://github.com/sailfishos-mirror/dbus-glib.git dbus-gmain
	cd dbus-gmain
	git reset --hard d42176ae4763e5288ef37ea314fe58387faf2005
}

build() {
	cd $pkgname-$pkgver
	./autogen.sh
	./configure --prefix=/usr \
	    --disable-static
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="$pkgdir/" install
# Remove tests
	rm -rf "$pkgdir/opt"
}
