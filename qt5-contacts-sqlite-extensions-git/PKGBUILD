# $Id$
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

_host="git.sailfishos.org"
_project=mer-core
_basename=contacts-sqlite
_branch=master

_gitname=qt${_basename}
pkgname=qt5-$_basename-extensions-git

pkgver=0.2.39.r0.g8d56179

pkgrel=1
pkgdesc="SQLite-based plugin for QtPIM Contacts"
arch=('x86_64' 'aarch64')
url="https://$_host/$_project/$_gitname#branch=$_branch"
license=('BSD-3-Clause')
depends=('qt5-pim-git' 'qt5-mlite-git')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}" "0001-fix-build-with-newer-qt.patch" "0002-drop-old-api.patch")
sha512sums=('SKIP'
'1096452e2326b311c4b14169cf5e0779cf9955c800178bc5b74d1706c76507b4d82442a50d8b707ac5df12f99dd6faf7a2374e554c2159408fa453b10d7f1ff6'
'036af277c180584106b92d34dbf90aeda10bcad5fbdfa17b69f4d9c461a01c48bdf93ed07f2c8bd990d6c6e259576013f4e1b77069dfa1abf4206513e319b781')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname}"
    patch -p1 --input="${srcdir}/0001-fix-build-with-newer-qt.patch"
    patch -p1 --input="${srcdir}/0002-drop-old-api.patch"
}

build() {
    cd "${srcdir}/${pkgname}"
    qmake-qt5 PREFIX=/usr
    make
}

check() {
    cd "${srcdir}/${pkgname}"
    make check
}

package() {
    cd "${srcdir}/${pkgname}"
    make INSTALL_ROOT="$pkgdir/" install
}
 
