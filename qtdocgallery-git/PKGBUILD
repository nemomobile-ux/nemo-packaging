_host="github.com"
_project=nemomobile-ux
_basename=qtdocgallery
_branch=nemo

_gitname=$_basename
pkgname=$_basename-git

pkgver=mer.5.2.0+git12.r3.g382232a

pkgrel=1
pkgdesc="The Glacier image gallery"
arch=('x86_64' 'aarch64')
url="https://$_host/$_project/$_gitname#branch=$_branch"
license=('LGPLv2')
optdepends=()
makedepends=('git' 'qt5-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s|/|.|'
}

build() {
  cd "${srcdir}/${pkgname}"
  qmake-qt5 tracker_enabled=no MODULE_VERSION=5.0.0
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make INSTALL_ROOT="${pkgdir}" install
}
 
