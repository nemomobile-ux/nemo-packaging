## $Id$
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=libmlocale
pkgver=0.7.6
pkgrel=6
pkgdesc="Contains classes MLocale and friends originally from libmeegotouch"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/libmlocale"
license=('LGPLv2')
depends=('qt6-base'
    'qt6-declarative'
    'icu=74.2')
makedepends=('qt6-tools' 'clang')
source=(
  "${url}/archive/refs/tags/$pkgver.tar.gz"
  "disable-werror.patch"
  '0002-mlocale-Fix-build-with-Qt6-JB-52793.patch'
)
sha256sums=('1b0db667a124be67251af0c5a3d920798a77b83ff11b404852f7fcb12d0f17af'
    '74a0ea1a421144c1fe9d5c3624d8e4eb4977a6286137b724a0b24999b1b0643b'
    'a3b0494ff99a424ba583bfa660470c06437d472a2cba27ea0cb25f705f081f91'
)

build() {
  mkdir -p $pkgname-$pkgver/build
  cd $pkgname-$pkgver
  patch -p1 --input="${srcdir}/disable-werror.patch"
  patch -p1 --input="${srcdir}/0002-mlocale-Fix-build-with-Qt6-JB-52793.patch"

  cd build
  QMAKE_BIN=qmake6 ../configure --prefix=/usr \
    --disable-static \
    -icu
  make
}

package() {
  cd $pkgname-$pkgver/build
  make INSTALL_ROOT="${pkgdir}" install

  # remove tests mess
  rm -rf "${pkgdir}/usr/lib/libmlocale-benchmarks5"
  rm -rf "${pkgdir}/usr/share/libmlocale-tests"
  rm -rf "${pkgdir}/usr/lib/libmlocale-tests5"
  rm -rf "${pkgdir}/usr/share/doc"
}