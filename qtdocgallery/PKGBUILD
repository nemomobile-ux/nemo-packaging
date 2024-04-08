pkgname=qtdocgallery

_basever=5.3.0
_gitver=6

pkgver=$_basever+git$_gitver

pkgrel=1
pkgdesc="The Glacier image gallery"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/qtdocgallery"
license=('LGPLv2')
optdepends=()
depends=('qt6-declarative' 'tracker3' 'tracker3-miners')
makedepends=('qt6-tools' 'qt6-old-features')
source=("${url}/archive/refs/tags/mer/$pkgver.tar.gz"
    '0001-workaround-missing-G_BEGIN-END_DECLS-in-tracker.patch'
    '0002-Allow-build-on-Qt6.patch')
sha256sums=('dd9a684011ca4e318452964ae6abc25a3c4da8ca7c8c45214bf2f6cbcb644a94'
    '43e1184286366eb01c66e5d7ec4bfa01b37ca7c56d37054888a2396adb056ff3'
    '75b9abbf7cb14ff68a0c2739e69970addc4986c3933f5a6694244164c47f7cc0')

prepare() {
    cd ${pkgname}-mer-$_basever-git$_gitver
    touch .git
    patch -p1 --input="${srcdir}/0001-workaround-missing-G_BEGIN-END_DECLS-in-tracker.patch"
    patch -p1 --input="${srcdir}/0002-Allow-build-on-Qt6.patch"
}


build() {
  cd ${pkgname}-mer-$_basever-git$_gitver
  qmake6 tracker_enabled=yes MODULE_VERSION=5.0.0
  make -j1
}

package() {
  cd ${pkgname}-mer-$_basever-git$_gitver
  make -j 1 INSTALL_ROOT="${pkgdir}" install
}
