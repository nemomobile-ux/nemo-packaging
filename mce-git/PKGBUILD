## $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=mce-git
pkgver=1.105.3.r0.ga087b59
pkgrel=1
pkgdesc="Mode Control Entity for Nokia mobile computers"
arch=('x86_64' 'aarch64')
url="https://git.sailfishos.org/mer-core/mce"
license=('GPL')
depends=('libngf-git' 'libiphb-git')
makedepends=('git' 'doxygen' 'libdsme' 'libsystemd' 'usb-moded')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://git.sailfishos.org/mer-core/mce.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    sed -i "s|libsystemd-daemon|libsystemd|g" ./Makefile
}

build() {
    cd "$srcdir/${pkgname%-git}"
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir/" install

    mv $pkgdir/usr/sbin $pkgdir/usr/bin

    rm $pkgdir/lib/systemd/system/multi-user.target.wants/mce.service
    rmdir $pkgdir/lib/systemd/system/multi-user.target.wants
    mv $pkgdir/lib/systemd $pkgdir/usr/lib/systemd

    rm -rf $pkgdir/lib
    rm -rf $pkgdir/var
}
