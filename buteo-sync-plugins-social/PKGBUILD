# $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=buteo-sync-plugins-social-git
pkgver=0.4.17.r2.gf09e294
pkgrel=1
pkgdesc="Syncs contact data from CardDAV services"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/buteo-sync-plugins-social"
license=('BSD-3-Clause')
depends=('libsocialcache'
	'buteo-syncfw'
	'qt5-contacts-sqlite-extensions'
	'mlite'
	'qt5-pim'
	'mkcal'
	'kcalendarcore'
	'libaccounts-qt'
	'nemo-qml-plugin-notifications')

makedepends=('git' 'qt5-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}" "0001-fix_build.patch")
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ) 2>/dev/null
}

prepare() {
    cd "${srcdir}/${pkgname}"
    patch -p1 --input="${srcdir}/0001-fix_build.patch"
}

build() {
  cd "${srcdir}/${pkgname}"
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
  cd "${srcdir}/${pkgname}"
  make -j 1 INSTALL_ROOT="${pkgdir}" install
}
