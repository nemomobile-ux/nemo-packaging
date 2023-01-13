## $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=nemo-qml-plugin-configuration
pkgver=0.2.7
pkgrel=1
pkgdesc="Configuration plugin for Nemo Mobile"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/nemo-qml-plugin-configuration"
license=('BSD')
depends=('mlite' 'nemo-qml-plugin-dbus')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('23b26e861f62f37709802ebc96049f30cfbef71d0c9b16433ef828fb7bea7e6b')

build() {
    cd $pkgname-$pkgver
    qmake
    make
}

package() {
    cd $pkgname-$pkgver
    make -j 1 INSTALL_ROOT="$pkgdir/" install
    cd "$pkgdir"
    mkdir -p ${pkgdir}/usr/lib/qt/qml/org/nemomobile/configuration/
    ln -sf /usr/lib/qt/qml/Nemo/Configuration/libnemoconfiguration.so ${pkgdir}/usr/lib/qt/qml/org/nemomobile/configuration/
    sed 's/Nemo.Configuration/org.nemomobile.configuration/' < ${pkgdir}/usr/lib/qt/qml/Nemo/Configuration/qmldir > ${pkgdir}/usr/lib/qt/qml/org/nemomobile/configuration/qmldir

    rm -rf $pkgdir/opt
}
