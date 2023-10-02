## $Id$
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=profiled
pkgver=1.0.14
pkgrel=1
pkgdesc="Sailfish Profile daemon, manages user settings"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/profiled"
license=('BSD')
depends=('profiled-settings-nemo' 'dbus')
makedepends=('doxygen')
source=("${url}/archive/refs/tags/$pkgver.tar.gz"
	"https://github.com/sailfishos-mirror/dbus-glib/archive/d42176ae4763e5288ef37ea314fe58387faf2005.tar.gz")
sha256sums=('154df8ab2cf4106d08cc40c25ce9b6d4bcb457039e41a229b6e9fdabfe7207be'
	    'f4c28d4740ac90863082e81c869e5178d25238b179747984faf0509e40d1afef')

prepare() {
    cd $pkgname-$pkgver
    cp ../dbus-glib-d42176ae4763e5288ef37ea314fe58387faf2005/dbus-gmain.* dbus-gmain/
}

build() {
  cd $pkgname-$pkgver
  make ROOT=${pkgdir}
}

package() {
  cd $pkgname-$pkgver
  make ROOT=${pkgdir} install
  rm -rf ${pkgdir}/etc/profiled
}
