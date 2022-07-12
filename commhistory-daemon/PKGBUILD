# $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=commhistory-daemon
pkgver=0.8.44
pkgrel=1
pkgdesc="Communications event history database daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/commhistory-daemon"
license=('LGPLv2')
depends=('qt5-base'
    'libcommhistory'
    'qtcontacts-sqlite'
    'mlite'
    'libmce-qt'
    'libmlocale'
    'telepathy-qt'
    'libqofono-qt5'
    'libngf-qt'
    'nemo-qml-plugin-contacts'
    'nemo-qml-plugin-notifications'
    'libqofonoext')
makedepends=('qt5-tools')
source=("${url}/archive/refs/tags/$pkgver.tar.gz"
    "commhistoryd.service"
    "0001-revert_adjust_to_new_messages_bus_names.patch")
sha256sums=('b6f6a2e8d31b97b206239c93a5b40608c584ca9e63fa0a4948040df97ba7759a'
    '2f39b6d9dc9796cfcfb3c2a970de005101cbc79b5e8dd4686113c21cd8fceda7'
    'a13eb14b6d31e39aad365ba0b59e325520e8e30666fa7d4299711dcb16299112')

prepare() {
  cd $pkgname-$pkgver
  #remove warnings
  sed '$d' common-project-config.pri > common-project-config.pri
  #don't build tests
  sed -i 's/tests//' commhistory-daemon.pro
  #fixup include and libs
  sed -i 's/# clock_gettime/INCLUDEPATH += \/usr\/include\/commhistory-qt5\/ \/usr\/include\/telepathy-qt5 \/usr\/include\/qofono-qt5\/ \/usr\/include\/contactcache-qt5 \/usr\/include\/qtcontacts-sqlite-qt5-extensions \/usr\/include\/qofonoext \/usr\/include\/mlocale5 \/usr\/include\/mlite5 \/usr\/include\/nemonotifications-qt5 \/usr\/include\/ngf-qt5 /' src/src.pro
  sed -i 's/LIBS += -lrt/LIBS += -L\/usr\/lib -lrt -lngf-qt5 -lnemonotifications-qt5 -ltelepathy-qt5 -lcommhistory-qt5 -lmlite5 -lQt5DBus -lmlocale5 -lQt5Gui -lQt5Core -lqofono-qt5 -lqofonoext -lcontactcache-qt5 -pie -rdynamic /' src/src.pro
  patch -p1 --input="${srcdir}/0001-revert_adjust_to_new_messages_bus_names.patch"
}

build() {
  cd $pkgname-$pkgver
  mkdir -p build
  cd build
  qmake ..
  make
}

package() {
  cd $pkgname-$pkgver/build
  make INSTALL_ROOT="${pkgdir}" install

#we use own service
  rm -rf ${pkgdir}/usr/lib/systemd/user/commhistoryd.service
  cp ${srcdir}/commhistoryd.service ${pkgdir}/usr/lib/systemd/user/commhistoryd.service
  mkdir -p ${pkgdir}/usr/lib/systemd/user/graphical-session.target.wants/
  ln -s ../commhistoryd.service ${pkgdir}/usr/lib/systemd/user/graphical-session.target.wants/
}
