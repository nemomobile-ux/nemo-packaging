# $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

_host="git.sailfishos.org"
_project=mer-core
_basename=voicecall
_branch=master

pkgname=$_basename-git

pkgver=0.7.11.r0.ga188e61

pkgrel=1
pkgdesc="Dialer engine for Nemo Mobile"
arch=('x86_64' 'aarch64')
url="https://$_host/$_project/$_basename#branch=$_branch"
license=('LGPL-2.1-only AND Apache-2.0')
depends=('mapplauncherd-qt' 'libpulse' 'nemo-qml-plugin-devicelock-git' 'qt5-resource-git')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}" "0001-fix_build_on_new_qt.path")
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
  patch -p1 --input "${srcdir}/0001-fix_build_on_new_qt.path"
}

build() {
  cd "${srcdir}/${pkgname}"
  qmake CONFIG+=enable-ngf CONFIG+=enable-audiopolicy CONFIG+=enable-telepathy CONFIG+=enable-nemo-devicelock CONFIG+=install-servicefiles
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make INSTALL_ROOT="${pkgdir}" install

  mkdir -p ${pkgdir}/usr/lib/systemd/user/user-session.target.wants
  ln -s ../voicecall-manager.service ${pkgdir}/usr/lib/systemd/user/user-session.target.wants/

  mkdir -p ${pkgdir}/usr/share/mapplauncherd/privileges.d
  install -m 644 -p rpm/voicecall-qt5.privileges ${pkgdir}/usr/share/mapplauncherd/privileges.d/
}
