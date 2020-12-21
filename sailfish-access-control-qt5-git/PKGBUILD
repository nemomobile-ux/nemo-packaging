 # $Id$
# Maintainer: TheKit <nekit1000 at gmail.com>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=sailfish-access-control-qt5-git
_pkgname=sailfish-access-control
pkgver=0.0.3.r0.g3926546
pkgrel=1
pkgdesc="Sailfish Access Control QML plugin"
arch=('x86_64' 'aarch64')
url="https://git.sailfishos.org/mer-core/sailfish-access-control"
license=('GPL')
depends=('qt5-declarative' 'sailfish-access-control')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://git.sailfishos.org/mer-core/sailfish-access-control.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname%-git}/qt"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${_pkgname%-git}/qt"
	qmake PREFIX=/usr
	make
}

package() {
	cd "$srcdir/${_pkgname%-git}/qt"
	make INSTALL_ROOT="$pkgdir/" install
}

