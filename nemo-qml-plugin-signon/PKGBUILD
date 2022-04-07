## $Id$

pkgname=nemo-qml-plugin-signon
pkgver=0.0.9
pkgrel=1
pkgdesc="SignOn plugin for Nemo Mobile"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/nemo-qml-plugin-signon"
license=('BSD')
depends=(
    'signond'
    'qt5-base'
    'qt5-declarative'
)
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('488283a12c475b6bf3d52a553c219db523d832ad4d4088be8b79c5334cecd88f')

build() {
    cd $pkgname-$pkgver
    qmake
    make
}

package() {
    cd $pkgname-$pkgver
    make -j 1 INSTALL_ROOT="$pkgdir/" install
    rm -rf $pkgdir/opt
}
