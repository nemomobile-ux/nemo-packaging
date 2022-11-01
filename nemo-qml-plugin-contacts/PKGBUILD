# $Id$
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=nemo-qml-plugin-contacts
pkgver=0.3.23
pkgrel=3
pkgdesc="Nemo QML contacts plugin"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/nemo-qml-plugin-contacts"
license=('BSD-3-Clause')
depends=('libphonenumber'
	'libmlocale'
	'mce'
	'mce-headers'
	'qtcontacts-sqlite'
	'buteo-sync-plugin-carddav'
	'icu=72.1')

makedepends=('qt5-tools')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('84b113123dfdc22bb4638cdc23e5544ab09429b68103c54ad10d1aa5baf1a075')

build() {
  cd $pkgname-$pkgver
  # Not possible to install in build subdir
  qmake-qt5 VERSION=$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make -j 1 INSTALL_ROOT="${pkgdir}" install
  # Remove installed tests
  rm -r "$pkgdir"/opt
}
