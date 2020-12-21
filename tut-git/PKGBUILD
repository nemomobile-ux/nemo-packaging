# $Id$
# Maintainer: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=tut-git
_srcname=tut
pkgver=0.0.4.r0.g70d36f0
pkgrel=1
pkgdesc="Sailfish C++ unit test framework"
arch=('x86_64' 'aarch64')
url="https://git.sailfishos.org/mer-core/tut"
license=('BSD')
depends=()
makedepends=('git' 'python2')
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
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
  python2 ./waf configure --prefix=/usr --version="0.0.4"
  python2 ./waf build
}

package() {
  cd "${srcdir}/${pkgname}"
  python2 ./waf install --destdir="${pkgdir}"
}

