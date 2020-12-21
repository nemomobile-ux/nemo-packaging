# $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

_host="git.sailfishos.org"
_project=mer-core
_basename=timed
_branch=master

_gitname=${_basename}
pkgname=qt5-$_basename-git

pkgver=3.6.6.r0.g5b75ada

pkgrel=1
pkgdesc="Mer time daemon"
arch=('x86_64' 'aarch64')
url="https://$_host/$_project/$_gitname#branch=$_branch"
license=('LGPL-2.1-or-later')
depends=('sailfish-access-control-git' 'qt5-iodata-git')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}" "0001-Fixes-build.patch")
md5sums=('SKIP' '24ee6dc76b93a0d95d1dfc9c4857a149')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ) 2>/dev/null
}

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -Np1 -i "${srcdir}/0001-Fixes-build.patch"
  mkdir -p src/h/timed-qt5/
  cp src/lib/qmacro.h src/h/timed-qt5/qmacro.h
  sed -i "s|libsystemd-daemon|libsystemd|g" ./src/server/server.pro
}

build() {
  cd "${srcdir}/${pkgname}"
  qmake
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make INSTALL_ROOT="$pkgdir/" install
  # Remove tests
  rm -rf "$pkgdir/opt"
}
