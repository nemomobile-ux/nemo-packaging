# $Id$
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

_host="git.sailfishos.org"
_project=mer-core
_basename=ofono
_branch=master

_gitname=libq${_basename}
pkgname=qt5-$_basename-git

pkgver=0.99.r0.g5e74475

pkgrel=1
pkgdesc="A library of Qt 5 bindings for ofono. Sailfish implementation"
arch=('x86_64' 'aarch64')
url="https://$_host/$_project/$_gitname#branch=$_branch"
license=('LGPL-2.1-or-later')
depends=('qt5-declarative')
makedepends=('git')
provides=("${pkgname%-git}" "libqofono" "libqofono-git" "libqofono-qt5")
conflicts=("${pkgname%-git}" "libqofono" "libqofono-git" "libqofono-qt5")
source=("${pkgname}::git+${url}")
md5sums=('SKIP')

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
    make INSTALL_ROOT="$pkgdir" install
    # Remove tests
    rm -r "$pkgdir"/opt
    rm -r "$pkgdir"/usr/lib/libqofono-qt5/tests/
}
 
