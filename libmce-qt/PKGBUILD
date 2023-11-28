## $Id$
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=libmce-qt
pkgver=1.5.1
pkgrel=1
pkgdesc="A library of Qt bindings for mce"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/libmce-qt"
license=('BSD-3-Clause')
depends=('qt6-declarative')
makedepends=('mce>=1.112' 'mce-headers')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('bb3afb6c00a4a3ef86be53ca932a665067ad4caf7605d99693aa9c350b1e1d13')

build() {
  mkdir -p $pkgname-$pkgver/build
  cd $pkgname-$pkgver/build
  qmake6 ..
  make
}

package() {
  cd $pkgname-$pkgver/build
  make -j 1 INSTALL_ROOT="${pkgdir}" install
}
