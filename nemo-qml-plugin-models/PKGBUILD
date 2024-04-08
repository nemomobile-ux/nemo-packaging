## $Id$
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>
# Contributor: Alexey Andreyev (aa13q) <aa13q@ya.ru>
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=nemo-qml-plugin-models
pkgver=0.2.6
pkgrel=1
pkgdesc="Nemo QML models plugin"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/nemo-qml-plugin-models"
license=('BSD')
depends=('nemo-qml-plugin-dbus' 'libmlocale>=0.7.6')
makedepends=('qt6-tools')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c598175da56b067340165549d171bd908064b451e3a3253cc3241d0a32e2c081')

build() {
    cd $pkgname-$pkgver
    qmake6 VERSION=$pkgver
    make
}

package() {
    cd $pkgname-$pkgver
    make -j 1 INSTALL_ROOT="$pkgdir/" install
    cd "$pkgdir"
    rm -rf opt
}
