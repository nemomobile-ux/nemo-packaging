## $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=ohm-plugin-ruleengine
pkgver=1.1.14
pkgrel=5
pkgdesc="A prolog-based OHM rule engine plugin"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/ohm-rule-engine"
license=('LGPL-2.1-only')
depends=('glib2'
    'ohm'
    'ohm-plugins-misc'
    'swi-prolog7'
    'libprolog'
    'policy-settings-common')

makedepends=('automake' 'autoconf')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3b4e2ffbe308323e62ac09b3b6407298c028f32b710d3e6cdd26491dee43193c')

prepare() {
    cd ohm-rule-engine-$pkgver
    echo -n "${pkgver}" > .tarball-version
    ./autogen.sh
}

build() {
  cd ohm-rule-engine-$pkgver
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --disable-static
  make
}

package() {
  cd ohm-rule-engine-$pkgver
  make DESTDIR="${pkgdir}" install
#library is hardcoded
  cd ${pkgdir}/usr/lib
  ln -s /usr/lib/swipl/lib/`uname -m`-linux/libswipl.so.8
#use basic rulse
  mkdir -p ${pkgdir}/usr/share/policy/rules/
  cd ${pkgdir}/usr/share/policy/rules/
  ln -s basic current
}
