# $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

_host="github.com"
_project=mer-hybris
_basename=ngfd-plugin-droid-vibrator
_branch=master

_gitname=$_basename
pkgname=ngfd-plugin-native-vibrator

pkgver=1.3.1.r0.gacc17b2
pkgrel=1
pkgdesc="Vibrator native plugin for ngfd"
arch=('x86_64' 'aarch64')
url="https://$_host/$_project/$_gitname#branch=$_branch"
license=('LGPL-2.1')
depends=('ngfd')
makedepends=('git' 'cmake' 'glib2')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "ngfd-plugin-droid-vibrator")
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
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DNATIVE_VIBRATOR=ON
    make -C "${pkgname}/build" all
}

package() {
    make -C "${srcdir}/${pkgname}/build" DESTDIR="$pkgdir" install
}
