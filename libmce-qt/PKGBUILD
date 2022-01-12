## $Id$
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=libmce-qt
pkgver=1.4.2
pkgrel=1
pkgdesc="A library of Qt bindings for mce"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/libmce-qt"
license=('BSD-3-Clause')
depends=('qt5-declarative')
makedepends=('mce' 'mce-headers')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9e1da41d8a392e8df75d37c858a0942a15ce7684efe1c8bb24dfa894edf53540')

build() {
  cd $pkgname-$pkgver
  mkdir -p build
  cd build
  qmake ..
  make
}

package() {
  cd $pkgname-$pkgver
  cd build
  make -j 1 INSTALL_ROOT="${pkgdir}" install
}
