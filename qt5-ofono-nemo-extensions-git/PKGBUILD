# $Id$
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>


pkgname=qt5-ofono-nemo-extensions-git
pkgver=1.0.27.r0.gebe45e0
pkgrel=1
pkgdesc="A Qt library for accessing nemomobile specific ofono extensions"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/libqofonoext"
license=('LGPL-2.1-only')
depends=('libqofono-qt5>=0.101')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"
    qmake
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make -j 1 INSTALL_ROOT="$pkgdir/" install
}
 
