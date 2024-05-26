## $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=nemo-qml-plugin-configuration
pkgver=0.2.8
pkgrel=2
pkgdesc="Configuration plugin for Nemo Mobile"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/nemo-qml-plugin-configuration"
license=('BSD')
depends=('mlite6' 'nemo-qml-plugin-dbus')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a796b742570526211da93c7ae7b70fccdf97ab592483e3311cf5748fb737a147')

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
