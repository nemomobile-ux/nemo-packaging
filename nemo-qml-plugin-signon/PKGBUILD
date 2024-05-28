## $Id$

pkgname=nemo-qml-plugin-signon
pkgver=0.0.9
pkgrel=2
pkgdesc="SignOn plugin for Nemo Mobile"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/nemo-qml-plugin-signon"
license=('BSD')
depends=(
    'signond6'
    'qt6-base'
    'qt6-declarative'
)
source=("${url}/archive/refs/tags/$pkgver.tar.gz"
    '0001-qt6.patch'
)
sha256sums=('488283a12c475b6bf3d52a553c219db523d832ad4d4088be8b79c5334cecd88f'
    '178417770c7bc18c0e593ad03fd14c0a09febeb6c7fc8840e3ae843d77253c14'
)

prepare() {
    cd $pkgname-$pkgver
  patch -p1 --input="${srcdir}/0001-qt6.patch"
}

build() {
    cd $pkgname-$pkgver
    qmake6
    make
}

package() {
    cd $pkgname-$pkgver
    make -j 1 INSTALL_ROOT="$pkgdir/" install
    rm -rf $pkgdir/opt
}
