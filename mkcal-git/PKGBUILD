# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

_host="git.sailfishos.org"
_project=mer-core
_basename=mkcal
_branch=master

_gitname=$_basename
pkgname=$_basename-git

pkgver=0.5.35.r0.g1088d94

pkgrel=1
pkgdesc="Telepathy <> QtContacts bridge for contacts"
arch=('x86_64' 'aarch64')
url="https://$_host/$_project/$_gitname#branch=$_branch"
license=('BSD-3-Clause')
depends=('kcalendarcore' 'qt5-timed-git' 'qmf-qt5')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}" "0001-KcalendarCore_not_provide_pc_files.path")
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ) 2>/dev/null
}

prepare() {
  cd "${srcdir}/${pkgname}"
  patch -p1 --input="${srcdir}/0001-KcalendarCore_not_provide_pc_files.path"
}

build() {
  cd "${srcdir}/${pkgname}"
  qmake
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make INSTALL_ROOT="${pkgdir}" install
  mv ${pkgdir}/usr/lib/pkgconfig/mkcal-qt5.pc ${pkgdir}/usr/lib/pkgconfig/libmkcal-qt5.pc
}