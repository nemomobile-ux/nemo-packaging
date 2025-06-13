# $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=timed
pkgver=3.6.24
pkgrel=1
pkgdesc="Mer time daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/timed"
license=('LGPL-2.1-or-later')
depends=('sailfish-access-control' 'libiodata>=0.19.14' 'tzdata-timed' 'connman' 'ofono' 'libdsme')
makedepends=('qt6-tools')
source=("${url}/archive/refs/tags/$pkgver.tar.gz"
    "0002-Fixes-access.patch"
)

sha256sums=('26b6833507c16af3259a02bc037ce128664b86c174a9e6d9e32571c0ce23301e'
	'cf81d073f2618fd914fbd5f55152580c7e3bf14f53eaf0950cb7998fd9460e02'
)

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i "${srcdir}/0002-Fixes-access.patch"

  mkdir -p src/h/timed-qt6/
  cp src/lib/qmacro.h src/h/timed-qt6/qmacro.h
  sed -i "s|libsystemd-daemon|libsystemd|g" ./src/server/server.pro
}

build() {
  cd $pkgname-$pkgver
  export TIMED_VERSION=${pkgver}
  qmake6 -recursive "CONFIG += dsme_dbus_if ofono"
  make
}

package() {
  cd $pkgname-$pkgver
  make -j 1 INSTALL_ROOT="$pkgdir/" install
  sed -i 's/WantedBy=pre-user-session.target/WantedBy=graphical-session-pre.target/' "${pkgdir}/usr/lib/systemd/user/timed.service"

  # Remove tests
  rm -rf "$pkgdir/opt"
  #add some dir
  install -d -m 0777 ${pkgdir}/var/lib/timed
  touch ${pkgdir}/var/lib/timed/localtime
  chmod 666 ${pkgdir}/var/lib/timed/localtime
  install -d -m 0777 ${pkgdir}/var/lib/timed/shared_events
  install -d -m 0777 ${pkgdir}/var/lib/timed/shared_settings

  # Make /etc/localtime a link to /var/lib/timed/localtime to make system time zone follow timed.
  install -d ${pkgdir}/etc/
  ln -sf /var/lib/timed/localtime ${pkgdir}/etc/localtime

  install -d ${pkgdir}/usr/lib/qt6/mkspecs/features/
  mv ${pkgdir}/usr/share/qt6/mkspecs/features/timed-qt6.prf ${pkgdir}/usr/lib/qt6/mkspecs/features/timed-qt6.prf
  mv ${pkgdir}/usr/share/qt6/mkspecs/features/timed-voland-qt6.prf ${pkgdir}/usr/lib/qt6/mkspecs/features/timed-voland-qt6.prf

  #setup services
  install -d ${pkgdir}/usr/lib/systemd/user/user-session.target.wants/
  ln -s ../timed.service ${pkgdir}/usr/lib/systemd/user/user-session.target.wants/
}
