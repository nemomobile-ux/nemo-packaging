# $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=buteo-sync-plugins-social
pkgver=0.4.19
pkgrel=1
pkgdesc="Syncs contact data from CardDAV services"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/buteo-sync-plugins-social"
license=('BSD-3-Clause')
depends=('libsocialcache'
	'buteo-syncfw'
	'qtcontacts-sqlite'
	'mlite'
	'qt5-pim'
	'mkcal'
	'kcalendarcore'
	'libaccounts-qt'
	'nemo-qml-plugin-notifications')

makedepends=('qt5-tools')
source=("${url}/archive/refs/tags/$pkgver.tar.gz"
    "0001-fix_build.patch")
sha256sums=('8a479605e30802276f676f4cbca0f0efeb2ce346fc59d7c8fd7562d98c8a5117'
    'c24e68d5e79f30fac73bfa0ee35b6fc307230f92cea6b53f6c50428024be42f7')

prepare() {
    cd $pkgname-$pkgver
    patch -p1 --input="${srcdir}/0001-fix_build.patch"
}

build() {
  cd $pkgname-$pkgver
  qmake-qt5 \
    "CONFIG+=dropbox" \
    "CONFIG+=facebook" \
    "CONFIG+=google" \
    "CONFIG+=onedrive" \
    "CONFIG+=twitter" \
    "CONFIG+=vk" \
    "CONFIG+=knowncontacts" \
    "CONFIG+=calendar"
  make
}

package() {
  cd $pkgname-$pkgver
  make -j 1 INSTALL_ROOT="${pkgdir}" install
}
