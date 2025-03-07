## $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=nemo-qml-plugin-configuration
pkgver=0.2.10
pkgrel=1
pkgdesc="Configuration plugin for Nemo Mobile"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/nemo-qml-plugin-configuration"
license=('BSD')
depends=('mlite6' 'nemo-qml-plugin-dbus')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('64d14d133c81209d1ff964034cdbfcf06665561fed0b258e2502e596aede70f0')

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
