## $Id$

pkgname=systemctl-user
pkgver=0.1
pkgrel=1
pkgdesc="Systemctl-user wrapper"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/systemd/"
license=('LGPL')
source=('systemctl-user')
sha256sums=('d9b2dcfb52fcce6b88f37b8bebafa372f5dc321785096d8b458064d4c2ebb956')


package() {
	mkdir -p $pkgdir/usr/bin/
	install -m 755 "$srcdir"/systemctl-user -D $pkgdir/usr/bin
}
