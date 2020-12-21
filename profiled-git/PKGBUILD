## $Id$
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=profiled-git
_srcname=profiled
pkgver=1.0.8.r0.gef80ddd
pkgrel=1
pkgdesc="Sailfish Profile daemon, manages user settings"
arch=('x86_64' 'aarch64')
url="https://git.sailfishos.org/mer-core/profiled"
license=('BSD')
depends=('dbus-glib')
makedepends=('git' 'doxygen')
optdepends=()
provides=("${_srcname}")
conflicts=()
source=(
  "${pkgname}::git+${url}.git"
)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ) 2>/dev/null
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make install
  mv /tmp/test-${_srcname}/usr ${pkgdir}
  mv /tmp/test-${_srcname}/etc ${pkgdir}
}

