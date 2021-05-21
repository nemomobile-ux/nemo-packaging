## $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=ohm-plugins-misc
_srcname=ohm-plugins-misc
_branch=master
pkgver=1.7.0.r0.gef2c89c
pkgrel=1
pkgdesc="A miscallaneous set of OHM plugins"
arch=('x86_64' 'aarch64')
url="https://git.sailfishos.org/mer-core/ohm-plugins-misc.git"
license=('LGPL-2.1-only')
depends=('glib2' 'ohm' 'libdres-ohm')
makedepends=('git' 'automake' 'autoconf')
optdepends=()
provides=("${_srcname}")
conflicts=()
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
    --disable-static \
    --enable-telephony \
    --disable-notification \
    --disable-videoep \
    --disable-fmradio
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}
 
