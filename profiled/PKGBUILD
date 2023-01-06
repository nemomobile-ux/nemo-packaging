## $Id$
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=profiled
pkgver=1.0.13
pkgrel=2
pkgdesc="Sailfish Profile daemon, manages user settings"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/profiled"
license=('BSD')
depends=('profiled-settings-nemo')
makedepends=('doxygen')
source=("${url}/archive/refs/tags/$pkgver.tar.gz"
	"https://github.com/sailfishos-mirror/dbus-glib/archive/d42176ae4763e5288ef37ea314fe58387faf2005.tar.gz")
sha256sums=('6345ac55e25afb568fcf7b4f7faf5e0b36d68d9fb724e2de47796439fb7d2f67'
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
