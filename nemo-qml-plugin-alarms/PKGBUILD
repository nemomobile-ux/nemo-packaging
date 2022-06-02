## $Id$

pkgname=nemo-qml-plugin-alarms
pkgver=0.3.11
pkgrel=2
pkgdesc="alarms plugin for Nemo Mobile"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/nemo-qml-plugin-alarms"
license=('BSD')
depends=('qt5-base' 'timed' 'qt5-declarative')
source=("${url}/archive/refs/tags/$pkgver.tar.gz"
    '0001-distinguish-wakeup-type-in-AlarmObject.patch')
sha256sums=('533fed4a2334b1c721476795e75eb406fa94265f169061732a84720fa96217be'
    '4f943807ce77f347b1bf1ab322370023abfca243488a8ab3b55658eb895d64a2'
)

prepare() {
  cd $pkgname-$pkgver
  patch -p1 --input="${srcdir}/0001-distinguish-wakeup-type-in-AlarmObject.patch"
}

build() {
    cd $pkgname-$pkgver
    qmake
    make
}

package() {
    cd $pkgname-$pkgver
    make -j 1 INSTALL_ROOT="$pkgdir/" install
    cd "$pkgdir"
    rm -rf opt
}
