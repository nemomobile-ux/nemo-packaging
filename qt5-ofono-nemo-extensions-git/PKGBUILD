# $Id$
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

_host="git.sailfishos.org"
_project=mer-core
_basename=ofono
_branch=master

_gitname=libq${_basename}ext
pkgname=qt5-$_basename-nemo-extensions-git

pkgver=1.0.25.r0.gbd09992

pkgrel=1
pkgdesc="A Qt library for accessing nemomobile specific ofono extensions"
arch=('x86_64' 'aarch64')
url="https://$_host/$_project/$_gitname#branch=$_branch"
license=('LGPL-2.1-only')
depends=('qt5-ofono-git')
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
    qmake-qt5
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make INSTALL_ROOT="$pkgdir/" install
}
 
