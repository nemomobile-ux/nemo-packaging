# $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=tzdata-timed
pkgver=2021a+git1
pkgrel=1
pkgdesc="Data files for the time daemon, timed"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/tzdata-timed"
license=('Public Domain')
depends=('tzdata')
source=("${url}/archive/refs/tags/$pkgver.tar.gz"
	"0001-Fixes-build.patch")
sha256sums=('5f3249f44bd35b0302e495421a116dee1123838c70852dad165c780a14edbf0e'
	'dc756a749924c9e2cdf6b7131da3f054ab41e6a2de1c03f18f50ab6c8e4314a9')

prepare() {
  cd $pkgname-2021a-git1
  patch -Np1 -i "${srcdir}/0001-Fixes-build.patch"
}

build() {
  cd $pkgname-2021a-git1
  make
}

package() {
  cd $pkgname-2021a-git1
  make -j 1 INSTALL_ROOT="$pkgdir/" install
}
