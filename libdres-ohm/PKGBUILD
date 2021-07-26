## $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=libdres-ohm
pkgver=1.1.17.r0.ga89f56c
pkgrel=1
pkgdesc="Dependency resolver for OHM"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/libdres-ohm"
license=('LGPL-2.1-only')
depends=('glib2' 'ohm' 'libtrace-ohm' 'libprolog')
makedepends=('git' 'automake' 'autoconf')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ) 2>/dev/null
}

prepare() {
    cd "${srcdir}/${pkgname}"
    ./autogen.sh
}

build() {
  cd "${srcdir}/${pkgname}"
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}
 
