# $Id$
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=nemo-qml-plugin-contacts-git
pkgver=0.3.21.r0.ge3d4df5
pkgrel=2
pkgdesc="Nemo QML contacts plugin"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/nemo-qml-plugin-contacts"
license=('BSD-3-Clause')
depends=('libphonenumber' 'qt5-mlocale-git' 'mce-git' 'mce-headers-git' 'qt5-contacts-sqlite-extensions-git' 'buteo-sync-plugin-carddav')
makedepends=('git' 'qt5-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}" "0001-remove-collection.extendedMetaData-as-it-doens-t-exi.patch")
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
    patch -p1 --input="${srcdir}/0001-remove-collection.extendedMetaData-as-it-doens-t-exi.patch"
}

build() {
  cd "${srcdir}/${pkgname}"
  # Not possible to install in build subdir
  qmake-qt5
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make -j 1 INSTALL_ROOT="${pkgdir}" install
  # Remove installed tests
  rm -r "$pkgdir"/opt
}
