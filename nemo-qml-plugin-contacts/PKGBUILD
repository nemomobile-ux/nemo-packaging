# $Id$
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=nemo-qml-plugin-contacts
pkgver=0.3.27
pkgrel=2
pkgdesc="Nemo QML contacts plugin"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/nemo-qml-plugin-contacts"
license=('BSD-3-Clause')
depends=('libphonenumber-nemo'
	'libmlocale'
	'mce'
	'mce-headers'
	'qtcontacts-sqlite'
	'libaccounts-qt6'
	'buteo-sync-plugin-carddav'
	'icu=74.2')

makedepends=(
    'qt6-tools'
    'clang'
)
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('47e95f0b879992b5d75dd5a18dc0d694c8a4e8cd97c5b43a0cc25c972bc07e1c')

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}"
}

build() {
  cd $pkgname-$pkgver
  # Not possible to install in build subdir
  qmake6 VERSION=$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make -j 1 INSTALL_ROOT="${pkgdir}" install
  # Remove installed tests
  rm -r "$pkgdir"/opt
}
