# $Id$

_host="github.com"
_project=nemomobile-ux
_basename=maliit-nemo-keyboard
_branch=master

_gitname=$_basename
pkgname=$_basename-git

pkgver=0.99.2.r12.g7eb4c0fa

pkgrel=1
pkgdesc="Contains the reference input method plugins, such as the Maliit Keyboard. "
arch=('x86_64' 'aarch64')
url="https://$_host/$_project/$_gitname#branch=$_branch"
license=('BSD')
depends=('maliit-framework')
makedepends=('git' 'cmake')
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
