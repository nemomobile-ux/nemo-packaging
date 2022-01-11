## $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=nemo-qml-plugin-configuration
pkgver=0.2.6
pkgrel=1
pkgdesc="Configuration plugin for Nemo Mobile"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/nemo-qml-plugin-configuration"
license=('BSD')
depends=('mlite' 'nemo-qml-plugin-dbus')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('5d619e6185e7a8a46212bb73c0cbfcead374c4565de8c2e32319a36ce7c5aa2a')

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
