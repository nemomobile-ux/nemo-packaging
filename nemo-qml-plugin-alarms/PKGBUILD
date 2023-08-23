## $Id$

pkgname=nemo-qml-plugin-alarms
pkgver=0.3.13
pkgrel=1
pkgdesc="alarms plugin for Nemo Mobile"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/nemo-qml-plugin-alarms"
license=('BSD')
depends=('qt6-base' 'timed' 'qt6-declarative')
source=("${url}/archive/refs/tags/$pkgver.tar.gz"
    '0002-distinguish-wakeup-type-in-AlarmObject.patch'
)
sha256sums=('bc17e1f0efaadca6af6d1b46b0e45c09657d96a5d4f39d5b5152e7e17a1c70e4'
    'b8e94c842fe3050ef742c69b5d1967d70e45fa4f308e3b9e185c5775a64a3e5d'
)

prepare() {
  cd $pkgname-$pkgver
  patch -p1 --input="${srcdir}/0002-distinguish-wakeup-type-in-AlarmObject.patch"
}

build() {
    cd $pkgname-$pkgver
    qmake6
    make
}

package() {
    cd $pkgname-$pkgver
    make -j 1 INSTALL_ROOT="$pkgdir/" install
    cd "$pkgdir"
    rm -rf opt
}
