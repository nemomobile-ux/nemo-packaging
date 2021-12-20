# $Id$
# Contributor: Donald Carr<sirspudd@gmail.com>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

#set -o errexit
#set -o xtrace

pkgname=qt5-connman-git
pkgver=20211220.04f72d5
pkgrel=1
pkgdesc='Qt Quick wrappers for connman'
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/libconnman-qt"
license=('GPL')
provides=('libconnman-qt' 'qt5-connman')
conflicts=('libconnman-qt' 'qt5-connman')
depends=('qt5-declarative' 'connman')
makedepends=('git' 'qt5-tools')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver () {
  cd ${srcdir}/${pkgname}
  echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

build() {
    cd ${srcdir}/${pkgname}
    qmake
    make
}

package() {
    cd ${srcdir}/${pkgname}
    make -j 1 INSTALL_ROOT="$pkgdir" install 
}
