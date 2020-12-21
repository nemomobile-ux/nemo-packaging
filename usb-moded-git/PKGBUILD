## $Id$
# Maintainer: TheKit <nekit1000 at gmail.com>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

_pkgname=usb-moded
pkgname=usb-moded-git
pkgver=0.86.0+mer40.r2.gb6c50d4
pkgrel=1
pkgdesc="Mer USB mode controller"
arch=('x86_64' 'aarch64')
url="https://git.sailfishos.org/mer-core/usb-moded"
license=('GPL')
depends=('libdsme' 'dbus-glib' 'udev' 'kmod' 'ssu-sysinfo' 'sailfish-access-control')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://git.sailfishos.org/mer-core/usb-moded.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed 's/^mer\///;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
    ./autogen.sh
    ./configure --prefix=/usr --enable-app-sync --enable-meegodevlock --enable-debug --enable-connman --enable-systemd --enable-mer-ssu --enable-sailfish-access-control
    make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir/" install
	mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"

    install -m 644 -D src/usb_moded-dbus.h "$pkgdir/usr/include/$_pkgname/usb_moded-dbus.h"
    install -m 644 -D src/usb_moded-modes.h "$pkgdir/usr/include/$_pkgname/usb_moded-modes.h"
    install -m 644 -D src/usb_moded-appsync-dbus.h "$pkgdir/usr/include/$_pkgname/usb_moded-appsync-dbus.h"
    install -m 644 -D src/com.meego.usb_moded.xml "$pkgdir/usr/include/$_pkgname/com.meego.usb_moded.xml"
    install -m 644 -D usb_moded.pc "$pkgdir/usr/lib/pkgconfig/usb_moded.pc"
	
}
