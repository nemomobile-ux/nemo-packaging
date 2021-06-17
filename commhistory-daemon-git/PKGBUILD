# $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

_host="git.sailfishos.org"
_project=mer-core
_basename=commhistory-daemon
_branch=master

pkgname=$_basename-git

pkgver=0.8.38.r0.g7e00f4a

pkgrel=1
pkgdesc="Communications event history database daemon"
arch=('x86_64' 'aarch64')
url="https://$_host/$_project/$_basename#branch=$_branch"
license=('LGPLv2')
depends=('qt5-base' 'libcommhistory-git' 'qt5-contacts-sqlite-extensions-git' 'qt5-mlite-git' 'qt5-mce-git' 'qt5-mlocale-git' 'telepathy-qt' 'libqofono-qt5' 'qt5-ngfd-git' 'mapplauncherd-qt-git' 'nemo-qml-plugin-contacts-git' 'nemo-qml-plugin-notifications-git')
makedepends=('git' 'qt5-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}")
md5sums=('SKIP')

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
  mkdir -p ${pkgdir}/usr/share/mapplauncherd/privileges.d
  install -m 644 -p ${srcdir}/${pkgname}/rpm/commhistory-daemon.privileges ${pkgdir}/usr/share/mapplauncherd/privileges.d
}
