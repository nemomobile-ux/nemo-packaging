# $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

_host="git.sailfishos.org"
_project=mer-core
_basename=resource
_branch=master

_gitname=lib${_basename//-/}
pkgname=meego-$_basename-git

pkgver=0.23.2.r0.g1c5a189

pkgrel=1
pkgdesc="MeeGo resource management low level C API libraries"
arch=('x86_64' 'aarch64')
url="https://$_host/$_project/$_gitname#branch=$_branch"
license=('LGPL-2.1-only')
depends=('dbus-glib' 'check')
makedepends=('git' 'automake' 'autoconf' 'libtool')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname}"
    echo "$pkgver" > .tarball-version
    ./autogen.sh --disable-static
}


build() {
    cd "${srcdir}/${pkgname}"
    ./configure --prefix=/usr --disable-static
    make -j1 #FIXME: For some reason it breaks otherwise
}

package() {
    cd "${srcdir}/${pkgname}"
    make DESTDIR="$pkgdir/" install
    # Remove tests
    rm -rf "$pkgdir"/opt

}
 
