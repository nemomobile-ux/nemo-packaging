## $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=ohm-plugins-misc
pkgver=1.7.1.r0.gc3e9574
pkgrel=1
pkgdesc="A miscallaneous set of OHM plugins"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/ohm-plugins-misc"
license=('LGPL-2.1-only')
depends=('glib2' 'ohm' 'libdres-ohm' 'meego-resource-git')
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
  sed -i 's/pre-user-session.target/graphical-session-pre.target/' "${pkgdir}/usr/lib/systemd/user/ohm-session-agent.service"
}
