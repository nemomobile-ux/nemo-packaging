# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

_host="git.sailfishos.org"
_project=mer-core
_basename=mkcal
_branch=master

_gitname=$_basename
pkgname=$_basename-git

pkgver=0.5.43.r0.g40f1205

pkgrel=1
pkgdesc="Telepathy <> QtContacts bridge for contacts"
arch=('x86_64' 'aarch64')
url="https://$_host/$_project/$_gitname#branch=$_branch"
license=('BSD-3-Clause')
depends=('kcalendarcore' 'qt5-timed-git' 'qmf-qt5')
makedepends=('git' 'cmake' 'extra-cmake-modules')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ) 2>/dev/null
}

build() {
    cmake \
        -B "${pkgname}/build" \
        -S "${pkgname}" \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr'
    make -C "${pkgname}/build" all
}

package() {
  make -C "${srcdir}/${pkgname}/build" DESTDIR="$pkgdir" install
}