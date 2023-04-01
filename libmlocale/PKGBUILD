## $Id$
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=libmlocale
pkgver=0.7.6
pkgrel=4
pkgdesc="Contains classes MLocale and friends originally from libmeegotouch"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/libmlocale"
license=('LGPLv2')
depends=('qt5-base'
	'icu=72.1')
makedepends=( 'qt5-tools')
source=(
  "${url}/archive/refs/tags/$pkgver.tar.gz"
  "disable-werror.patch"
  )
sha256sums=('1b0db667a124be67251af0c5a3d920798a77b83ff11b404852f7fcb12d0f17af'
    '74a0ea1a421144c1fe9d5c3624d8e4eb4977a6286137b724a0b24999b1b0643b')

build() {
  cd $pkgname-$pkgver
  patch -p1 --input="${srcdir}/disable-werror.patch"
  mkdir -p build
  cd build
  ../configure --prefix=/usr \
    --disable-static \
    -icu
  make
}

package() {
  cd $pkgname-$pkgver
  cd build
  make INSTALL_ROOT="${pkgdir}" install

  # move *.prf into right folder
  mkdir -p ${pkgdir}/usr/lib/qt/mkspecs/features/
  mv ${pkgdir}/usr/share/qt/mkspecs/features/mlocale_common.prf ${pkgdir}/usr/lib/qt/mkspecs/features/mlocale_common.prf
  mv ${pkgdir}/usr/share/qt/mkspecs/features/mlocale_coverage.prf ${pkgdir}/usr/lib/qt/mkspecs/features/mlocale_coverage.prf
  mv ${pkgdir}/usr/share/qt/mkspecs/features/mlocale_defines.prf ${pkgdir}/usr/lib/qt/mkspecs/features/mlocale_defines.prf
  mv ${pkgdir}/usr/share/qt/mkspecs/features/mlocale.prf ${pkgdir}/usr/lib/qt/mkspecs/features/mlocale.prf
  mv ${pkgdir}/usr/share/qt/mkspecs/features/mlocale_translations.prf ${pkgdir}/usr/lib/qt/mkspecs/features/mlocale_translations.prf

  # remove tests mess
  rm -rf "${pkgdir}/usr/lib/libmlocale-benchmarks5"
  rm -rf "${pkgdir}/usr/share/libmlocale-tests"
  rm -rf "${pkgdir}/usr/lib/libmlocale-tests5"
  rm -rf "${pkgdir}/usr/share/doc"
}
