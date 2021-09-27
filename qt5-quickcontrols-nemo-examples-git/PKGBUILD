# $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Chupligin Sergey <neochapay@gmail.com>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

_host="github.com"
_project=nemomobile-ux
_basename=quickcontrols-nemo
_branch=master

_gitname=qt$_basename
pkgname=qt5-quickcontrols-nemo-examples-git

pkgver=5.6.1.r0.g49188d0

pkgrel=1
pkgdesc="Nemomobile Qt Quick Controls"
arch=('x86_64' 'aarch64')
url="https://$_host/$_project/$_gitname#branch=$_branch"
license=('LGPL-2.1-only AND Apache-2.0')
depends=('qt5-quickcontrols-nemo' 'qt5-glacier-app' 'nemo-qml-plugin-statusnotifier-git')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ) 2>/dev/null
}

prepare() {
  # TODO: upstream building examples optional
  # https://t.me/NemoMobile/17555
  cd "${srcdir}/${pkgname}"
  sed -i 's/src//' qtquickcontrols-nemo.pro
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir -p build
  cd build
  qmake ..
  make
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make -j 1 INSTALL_ROOT="${pkgdir}" install
}
