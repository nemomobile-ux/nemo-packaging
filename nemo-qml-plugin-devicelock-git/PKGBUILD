## $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=nemo-qml-plugin-devicelock-git
pkgver=0.3.5.r0.g3569d10
pkgrel=1
pkgdesc="Device lock plugin for Nemo Mobile"
arch=('x86_64' 'aarch64')
url="https://git.sailfishos.org/mer-core/nemo-qml-plugin-devicelock"
license=('BSD-3-Clause')
depends=('nemo-qml-plugin-dbus' 'nemo-keepalive-git')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://git.sailfishos.org/mer-core/nemo-qml-plugin-devicelock.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    sed -i "s|libsystemd-daemon|libsystemd|g" ./src/nemo-devicelock/host/host.pro
    sed -i "s|libsystemd-daemon|libsystemd|g" ./src/daemon/daemon.pro
}

build() {
    cd "$srcdir/${pkgname%-git}"
    qmake
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make INSTALL_ROOT="$pkgdir/" install
    cd "$pkgdir"
    mkdir -p usr/lib/${pkgname}
    mv usr/libexec/* usr/lib/${pkgname}
    rm -rf usr/libexec
}
