## $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=ssu-sysinfo-git
pkgver=1.2.1.r0.g3a4fa10
pkgrel=1
pkgdesc="Tools and libraries for getting ssu information without D-Bus IPC"
arch=('x86_64' 'aarch64')
url="https://git.sailfishos.org/mer-core/ssu-sysinfo"
license=('GPL')
depends=('glibc')
makedepends=('git' 'check')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://git.sailfishos.org/mer-core/ssu-sysinfo.git' 'fix-library-linking.patch')
md5sums=('SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    patch -p1 --input="${srcdir}/fix-library-linking.patch"
}

build() {
   cd "$srcdir/${pkgname%-git}"
   util/verify_version.sh
   unset LD_AS_NEEDED
   make
}

package() {
   cd "$srcdir/${pkgname%-git}"
   make DESTDIR="$pkgdir/" install
}
