## $Id$
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>
# Contributor: Alexey Andreyev (aa13q) <aa13q@ya.ru>
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=nemo-qml-plugin-models
pkgver=0.2.5
pkgrel=1
pkgdesc="Nemo QML models plugin"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/nemo-qml-plugin-models"
license=('BSD')
depends=('nemo-qml-plugin-dbus' 'libmlocale')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1baed689a277bcf7980c06f384af483ced441a01a502f67dd78b333f4c3ce22e')

build() {
    cd $pkgname-$pkgver
    qmake VERSION=$pkgver
    make
}

package() {
    cd $pkgname-$pkgver
    make -j 1 INSTALL_ROOT="$pkgdir/" install
    cd "$pkgdir"
    rm -rf opt
}
