# $Id$
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

_host="git.sailfishos.org"
_project=mer-core
_basename=contacts
_branch=master

_gitname=lib${_basename}
pkgname=qt5-$_basename-git

pkgver=0.2.8.r0.g06adaa5

pkgrel=1
pkgdesc="A contact cache and various helper functions"
arch=('x86_64' 'aarch64')
url="https://$_host/$_project/$_gitname#branch=$_branch"
license=('BSD-3-Clause')
depends=('qt5-declarative' 'qt5-pim-git' 'qt5-mlite-git' 'qt5-mlocale-git' 'qt5-mce-git' 'libphonenumber' 'qt5-contacts-sqlite-extensions-git')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}" "update-api-for-qtpim-5.9.patch")
md5sums=('SKIP' '62ba203d84f402c3179c5a7d6a679b8a')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname}"
    patch -p1 --input="${srcdir}/update-api-for-qtpim-5.9.patch"
}

build() {
    cd "${srcdir}/${pkgname}"
    qmake-qt5 PREFIX=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make INSTALL_ROOT="$pkgdir/" install
    
    # Remove installed tests
    rm -r "$pkgdir"/opt
}
 
