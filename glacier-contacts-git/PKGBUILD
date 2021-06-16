# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

_host="github.com"
_project=nemomobile-ux
_basename=glacier-contacts
_branch=master

_gitname=$_basename
pkgname=$_basename-git

pkgver=0.7.3.r2.gb5f506f

pkgrel=1
pkgdesc="QML based contacts application for nemomobile"
arch=('x86_64' 'aarch64')
url="https://$_host/$_project/$_gitname#branch=$_branch"
license=('BSD-3-Clause')
depends=('nemo-qml-plugin-thumbnailer-git' 'nemo-qml-plugin-contacts-git' 'nemo-qml-plugin-folderlistmodel-git' 'glacier-gallery-git' 'glacier-filemuncher-git' 'contactsd-git' 'nemo-qml-plugin-dbus' 'qt5-glacier-app-git')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ) 2>/dev/null
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
  make -j 1 INSTALL_ROOT="${pkgdir}" install
}