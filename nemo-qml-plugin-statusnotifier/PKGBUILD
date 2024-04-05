# $Id$
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

_host="github.com"
_project=nemomobile-ux
_basename=nemo-qml-plugin-statusnotifier
_branch=master

_gitname=$_basename
pkgname=$_basename

pkgver=1.0.1

pkgrel=2
pkgdesc="Nemo QML statusnotifier plugin"
arch=('x86_64' 'aarch64')
url="https://$_host/$_project/$_gitname"
license=('LGPL-2.0-or-later')
depends=('qt6-declarative')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('dd952e1848358edc276861c8bd9939ffe64d3df813388d7d63e736e353afc8fc')

build() {
  cd $pkgname-$pkgver
  mkdir -p build
  cd build
  qmake6 ..
  make
}

package() {
  cd $pkgname-$pkgver/build
  make -j 1 INSTALL_ROOT="${pkgdir}" install
}
