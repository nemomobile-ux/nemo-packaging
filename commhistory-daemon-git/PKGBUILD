# $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=commhistory-daemon-git
pkgver=0.8.38.r1.gbc11fbd
pkgrel=1
pkgdesc="Communications event history database daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/nemomobile-ux/commhistory-daemon.git"
license=('LGPLv2')
depends=('qt5-base' 'libcommhistory-git' 'qt5-contacts-sqlite-extensions-git' 'mlite' 'qt5-mce-git' 'qt5-mlocale-git' 'telepathy-qt' 'libqofono-qt5' 'qt5-ngfd-git' 'nemo-qml-plugin-contacts-git' 'nemo-qml-plugin-notifications-git' 'qt5-ofono-nemo-extensions-git')
makedepends=('git' 'qt5-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}" "commhistoryd.service")
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ) 2>/dev/null
}

prepare() {
  cd "${srcdir}/${pkgname}"
  #remove warnings
  sed '$d' common-project-config.pri > common-project-config.pri
  #don't build tests
  sed -i 's/tests//' commhistory-daemon.pro
  #fixup include and libs
  sed -i 's/# clock_gettime/INCLUDEPATH += \/usr\/include\/commhistory-qt5\/ \/usr\/include\/telepathy-qt5 \/usr\/include\/qofono-qt5\/ \/usr\/include\/contactcache-qt5 \/usr\/include\/qtcontacts-sqlite-qt5-extensions \/usr\/include\/qofonoext \/usr\/include\/mlocale5 \/usr\/include\/mlite5 \/usr\/include\/nemonotifications-qt5 \/usr\/include\/ngf-qt5 /' src/src.pro
  sed -i 's/LIBS += -lrt/LIBS += -L\/usr\/lib -lrt -lngf-qt5 -lnemonotifications-qt5 -ltelepathy-qt5 -lcommhistory-qt5 -lmlite5 -lQt5DBus -lmlocale5 -lQt5Gui -lQt5Core -lqofono-qt5 -lqofonoext -lcontactcache-qt5 -pie -rdynamic /' src/src.pro
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir -p build
  cd build
  qmake ..
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  cd build
  make INSTALL_ROOT="${pkgdir}" install
#we use own service
  rm -rf ${pkgdir}/usr/lib/systemd/user/commhistoryd.service
  cp ${srcdir}/commhistoryd.service ${pkgdir}/usr/lib/systemd/user/commhistoryd.service
  mkdir -p ${pkgdir}/usr/lib/systemd/user/graphical-session.target.wants/
  ln -s ../commhistoryd.service ${pkgdir}/usr/lib/systemd/user/graphical-session.target.wants/
  
}
