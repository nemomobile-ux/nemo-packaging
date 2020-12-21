# $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

_host="git.sailfishos.org"
_project=mer-core
_basename=resource
_branch=master

_gitname=lib${_basename//-/}qt
pkgname=qt5-$_basename-git

pkgver=1.30.4.r0.gcd0ce5a

pkgrel=1
pkgdesc="Resource Policy Qt API"
arch=('x86_64' 'aarch64')
url="https://$_host/$_project/$_gitname#branch=$_branch"
license=('LGPL-2.1-or-later')
depends=('qt5-base' 'meego-resource-git')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
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
    make INSTALL_ROOT="$pkgdir/" install
    # Remove tests and empty dirs
    rm -rf "$pkgdir/usr/lib/libresourceqt-qt5-tests"
    rm -rf "$pkgdir/usr/share/doc"
    rm -rf "$pkgdir/usr/share/man"
}
 
