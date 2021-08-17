## $Id$
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=profiled-git
pkgver=1.0.12.r0.g32b02ae
pkgrel=4
pkgdesc="Sailfish Profile daemon, manages user settings"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/profiled"
license=('BSD')
depends=('dbus-glib' 'profiled-settings-nemo')
makedepends=('git' 'doxygen')
provides=("${pkgname%-git}")
source=(
  "${pkgname}::git+${url}"
)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ) 2>/dev/null
}

prepare() {
    cd "$srcdir/${pkgname}"
    git submodule update --init --recursive
}

build() {
  cd "${srcdir}/${pkgname}"
  make ROOT=${pkgdir}
}

package() {
  cd "${srcdir}/${pkgname}"
  make ROOT=${pkgdir} install
  rm -rf ${pkgdir}/etc/profiled
}

