## $Id$
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>
# Contributor: Alexey Andreyev (aa13q) <aa13q@ya.ru>

pkgname=nemo-qml-plugin-models
pkgver=0.2.1
pkgrel=1
pkgdesc="Nemo QML models plugin"
arch=('x86_64' 'aarch64')
url="https://git.sailfishos.org/mer-core/nemo-qml-plugin-models"
license=('BSD')
depends=('nemo-qml-plugin-dbus' 'qt5-mlocale-git')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/sailfishos/nemo-qml-plugin-models.git')
md5sums=('SKIP')

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
    rm -rf opt
}
