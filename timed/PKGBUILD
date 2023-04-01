# $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=timed
pkgver=3.6.18
pkgrel=2
pkgdesc="Mer time daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/timed"
license=('LGPL-2.1-or-later')
depends=('sailfish-access-control' 'libiodata' 'tzdata-timed' 'connman' 'ofono' 'pcre')
source=("${url}/archive/refs/tags/$pkgver.tar.gz"
    "0001-Fixes-build.patch"
    "0002-Fixes-access.patch")

sha256sums=('8899c6b4d684492ecdba68f998df161ba1416b45f167c80d1d7e9826e19cf737'
	'deb706820ce9b76c0994d35e72394bac8c739d0593736a1713736c491ecd513a'
	'cf81d073f2618fd914fbd5f55152580c7e3bf14f53eaf0950cb7998fd9460e02')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i "${srcdir}/0001-Fixes-build.patch"
  patch -Np1 -i "${srcdir}/0002-Fixes-access.patch"
  mkdir -p src/h/timed-qt5/
  cp src/lib/qmacro.h src/h/timed-qt5/qmacro.h
  sed -i "s|libsystemd-daemon|libsystemd|g" ./src/server/server.pro
}

build() {
  cd $pkgname-$pkgver
  qmake
  make
}

package() {
  cd $pkgname-$pkgver
  make -j 1 INSTALL_ROOT="$pkgdir/" install
  sed -i 's/WantedBy=pre-user-session.target/WantedBy=graphical-session-pre.target/' "${pkgdir}/usr/lib/systemd/user/timed-qt5.service"

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

  install -d ${pkgdir}/usr/lib/qt/mkspecs/features/
  mv ${pkgdir}/usr/share/qt/mkspecs/features/timed-qt5.prf ${pkgdir}/usr/lib/qt/mkspecs/features/timed-qt5.prf
  mv ${pkgdir}/usr/share/qt/mkspecs/features/timed-voland-qt5.prf ${pkgdir}/usr/lib/qt/mkspecs/features/timed-voland-qt5.prf

  #setup services
  install -d ${pkgdir}/usr/lib/systemd/user/user-session.target.wants/
  ln -s ../timed-qt5.service ${pkgdir}/usr/lib/systemd/user/user-session.target.wants/
}
