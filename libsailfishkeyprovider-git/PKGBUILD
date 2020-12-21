## $Id$
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>
# Contributor: Alexey Andreyev (aa13q) <aa13q@ya.ru>

pkgname=libsailfishkeyprovider-git
pkgver=1.0.3.r0.g86d6dcb
pkgrel=1
pkgdesc="Library providing access to decoded OAuth2 keys"
arch=('x86_64' 'aarch64')
url="https://git.sailfishos.org/mer-core/libsailfishkeyprovider"
license=('LGPLv2')
depends=('gcc-libs')
makedepends=('git' 'qt5-base')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://git.sailfishos.org/mer-core/libsailfishkeyprovider.git')
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
    make INSTALL_ROOT="$pkgdir/" install
    cd "$pkgdir"
    rm -rf opt
}
