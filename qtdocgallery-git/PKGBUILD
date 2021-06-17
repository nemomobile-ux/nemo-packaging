_host="github.com"
_project=nemomobile-ux
_basename=qtdocgallery
_branch=nemo

_gitname=$_basename
pkgname=$_basename-git

pkgver=mer.5.2.0+git12.r40.ga8fdaf6

pkgrel=1
pkgdesc="The Glacier image gallery"
arch=('x86_64' 'aarch64')
url="https://$_host/$_project/$_gitname#branch=$_branch"
license=('LGPLv2')
optdepends=()
depends=('qt5-declarative' 'tracker3' 'tracker3-miners')
makedepends=('git' 'qt5-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}" '0001-workaround-missing-G_BEGIN-END_DECLS-in-tracker.patch')
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s|/|.|'
}

prepare() {
    cd "${srcdir}/${pkgname}"
    patch -p1 --input="${srcdir}/0001-workaround-missing-G_BEGIN-END_DECLS-in-tracker.patch"
}


build() {
  cd "${srcdir}/${pkgname}"
  qmake-qt5 tracker_enabled=yes MODULE_VERSION=5.0.0
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make -j 1 INSTALL_ROOT="${pkgdir}" install
}
 
