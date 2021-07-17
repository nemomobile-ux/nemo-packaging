## $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=nemo-qml-plugin-configuration-git
pkgver=0.2.3.r0.g917ed97
pkgrel=2
pkgdesc="Configuration plugin for Nemo Mobile"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/nemo-qml-plugin-configuration"
license=('BSD')
depends=('mlite' 'nemo-qml-plugin-dbus')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    qmake
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make -j 1 INSTALL_ROOT="$pkgdir/" install
    cd "$pkgdir"
    mkdir -p ${pkgdir}/usr/lib/qt/qml/org/nemomobile/configuration/
    ln -sf /usr/lib/qt/qml/Nemo/Configuration/libnemoconfiguration.so ${pkgdir}/usr/lib/qt/qml/org/nemomobile/configuration/
    sed 's/Nemo.Configuration/org.nemomobile.configuration/' < ${pkgdir}/usr/lib/qt/qml/Nemo/Configuration/qmldir > ${pkgdir}/usr/lib/qt/qml/org/nemomobile/configuration/qmldir

    rm -rf opt
}
