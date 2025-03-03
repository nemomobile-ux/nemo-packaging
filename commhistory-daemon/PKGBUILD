# $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=commhistory-daemon
pkgver=0.8.44
pkgrel=2
pkgdesc="Communications event history database daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/commhistory-daemon"
license=('LGPLv2')
depends=('qt6-base'
    'libcommhistory'
    'qtcontacts-sqlite'
    'mlite6'
    'libmce-qt'
    'libmlocale'
    'libqofono-qt6'
    'libngf-qt6'
    'nemo-qml-plugin-contacts'
    'nemo-qml-plugin-notifications>=1.0.12'
    'libqofonoext')
makedepends=('qt6-tools' 'clang' 'python')
source=("${url}/archive/refs/tags/$pkgver.tar.gz"
    "commhistoryd.service"
    "0001-revert_adjust_to_new_messages_bus_names.patch")
sha256sums=('b6f6a2e8d31b97b206239c93a5b40608c584ca9e63fa0a4948040df97ba7759a'
    '9443be6743da6d81a2b95669e04ae6cf7ea94bffbb4d4ba7bd1cb8f5b799202d'
    'a13eb14b6d31e39aad365ba0b59e325520e8e30666fa7d4299711dcb16299112')

prepare() {
  cd $pkgname-$pkgver
  #remove warnings
  sed '$d' common-project-config.pri > common-project-config.pri
  #don't build tests
  sed -i 's/tests//' commhistory-daemon.pro
  #fixup include and libs
  sed -i 's/# clock_gettime/INCLUDEPATH += \/usr\/include\/commhistory-qt6\/ \/usr\/include\/telepathy-qt6 \/usr\/include\/qofono-qt6\/ \/usr\/include\/contactcache-qt6 \/usr\/include\/qtcontacts-sqlite-qt6-extensions \/usr\/include\/qofonoext \/usr\/include\/mlocale6 \/usr\/include\/mlite6 \/usr\/include\/nemonotifications-qt6 \/usr\/include\/ngf-qt6 /' src/src.pro
  sed -i 's/LIBS += -lrt/LIBS += -L\/usr\/lib -lrt -lngf-qt6 -lnemonotifications-qt6 -ltelepathy-qt6 -lcommhistory-qt6 -lmlite6 -lqt6DBus -lmlocale5 -lqt6Gui -lqt6Core -lqofono-qt6 -lqofonoext -lcontactcache-qt6 -pie -rdynamic /' src/src.pro
  patch -p1 --input="${srcdir}/0001-revert_adjust_to_new_messages_bus_names.patch"
}

build() {
  cd $pkgname-$pkgver
  mkdir -p build
  cd build
  qmake6 ..
  make
}

package() {
  cd $pkgname-$pkgver/build
  make INSTALL_ROOT="${pkgdir}" install

#we use own service
  rm -rf ${pkgdir}/usr/lib/systemd/user/commhistoryd.service
  cp ${srcdir}/commhistoryd.service ${pkgdir}/usr/lib/systemd/user/commhistoryd.service
  mkdir -p ${pkgdir}/usr/lib/systemd/user/user-session.target.wants/
  ln -s ../commhistoryd.service ${pkgdir}/usr/lib/systemd/user/user-session.target.wants/
}
