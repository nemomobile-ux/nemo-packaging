## $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=nemo-qml-plugin-signon-git
pkgver=0.0.9.r0.g0db5900
pkgrel=1
pkgdesc="signon plugin for Nemo Mobile"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/nemo-qml-plugin-signon"
license=('BSD')
depends=('signond' 'qt5-declarative')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/${pkgname}"
}

build() {
    cd "$srcdir/${pkgname}"
    qmake
    make
}

package() {
    cd "$srcdir/${pkgname}"
    make -j 1 INSTALL_ROOT="$pkgdir/" install
    rm -rf $pkgdir/opt
}
