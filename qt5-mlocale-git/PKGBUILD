## $Id$
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=qt5-mlocale-git
_pkgname=qt-mlocale-git
pkgver=0.7.2.r0.g3b0686ab
pkgrel=1
_project=mer-core
_branch=master
pkgdesc="Contains classes MLocale and friends originally from libmeegotouch"
arch=('x86_64' 'aarch64')
# FIXME: libmlocale qt-related repo naming
url="https://git.sailfishos.org/$_project/libmlocale#branch=$_branch"
license=('LGPLv2')
depends=('qt5-base')
makedepends=('git')
optdepends=()
provides=("${pkgname}-git" "${_pkgname}-git")
conflicts=("${pkgname}-git" "${_pkgname}-git")
source=(
  "${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ) 2>/dev/null
}

build() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p build
  cd build
  ../configure --prefix=/usr 
  #qmake ..
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  cd build
  make INSTALL_ROOT="${pkgdir}" install
  # remove tests mess
  rm -rf "${pkgdir}/usr/lib/libmlocale-benchmarks5"
  rm -rf "${pkgdir}/usr/share/libmlocale-tests"
  rm -rf "${pkgdir}/usr/lib/libmlocale-tests5"
  rm -rf "${pkgdir}/usr/share/doc"
}
