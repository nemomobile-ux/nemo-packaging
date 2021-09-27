## $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=qt5-ngfd-git
_pkgname=libngf-qt-git
pkgver=0.8.1.r0.ga637387
pkgrel=1
pkgdesc="Qt-based client library for Non-Graphic Feedback daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/libngf-qt"
license=('GPL')
depends=('qt5-declarative' 'libngf' 'qt5-feedback')
makedepends=('git')
provides=("${_pkgname%-git}" "${pkgname%-git}")
conflicts=("${_pkgname%-git}" "${pkgname%-git}")
source=("${pkgname%-git}::git+${url}")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${pkgname%-git}"
    qmake PREFIX=/usr

    # Hack for PREFIX path not being passed to src subproject for some reason
    cd src
    qmake PREFIX=/usr
    cd ..

    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make -j 1 INSTALL_ROOT="$pkgdir/" install
    # Remove tests
    rm -rf "$pkgdir/opt"
}
