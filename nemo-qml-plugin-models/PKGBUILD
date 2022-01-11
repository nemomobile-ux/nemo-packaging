## $Id$
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>
# Contributor: Alexey Andreyev (aa13q) <aa13q@ya.ru>
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=nemo-qml-plugin-models
pkgver=0.2.4
pkgrel=1
pkgdesc="Nemo QML models plugin"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/nemo-qml-plugin-models"
license=('BSD')
depends=('nemo-qml-plugin-dbus' 'libmlocale')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7bc9843ba4da057016b8efe9e5eb68cf2099b90d68bef2810d828434b06e6004')

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
