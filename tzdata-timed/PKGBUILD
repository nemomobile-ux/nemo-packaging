# $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=tzdata-timed
pkgver=2021a+git3
pkgrel=1
pkgdesc="Data files for the time daemon, timed"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/tzdata-timed"
license=('Public Domain')
depends=('tzdata')
makedepends=('pcre')
source=("${url}/archive/refs/tags/$pkgver.tar.gz"
	"0001-Fixes-build.patch")
sha256sums=('2e072f5d2cc3cbebf714fa36708b44e01998e30cb581e6294e5be7ada7e64836'
	'dc756a749924c9e2cdf6b7131da3f054ab41e6a2de1c03f18f50ab6c8e4314a9')

prepare() {
  cd $pkgname-2021a-git3
  patch -Np1 -i "${srcdir}/0001-Fixes-build.patch"
}

build() {
  cd $pkgname-2021a-git3
  make
}

package() {
  cd $pkgname-2021a-git3
  make -j 1 INSTALL_ROOT="$pkgdir/" install
}
