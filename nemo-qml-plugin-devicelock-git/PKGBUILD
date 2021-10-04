## $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=nemo-qml-plugin-devicelock-git
pkgver=0.3.7.r0.g453727e
pkgrel=2
pkgdesc="Device lock plugin for Nemo Mobile"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/nemo-qml-plugin-devicelock"
license=('BSD-3-Clause')
depends=('nemo-qml-plugin-dbus' 'nemo-keepalive-git')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}" "nemo-devicelock.service" "nemo-devicelock.socket")
md5sums=('SKIP' 'SKIP' 'SKIP')

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
    make -j 1 INSTALL_ROOT="$pkgdir/" install
    cd "$pkgdir"
    mkdir -p run/nemo-devicelock
    #install services to bin dir not libexec
    mkdir -p usr/bin
    mv usr/libexec/nemo-devicelock usr/bin/nemo-devicelock-daemon
    rm -rf usr/libexec

    #fixup systemd services
    rm -rf ${pkgdir}/usr/lib/systemd/system/nemo-devicelock.*
    cp ${srcdir}/nemo-devicelock* ${pkgdir}/usr/lib/systemd/system/
    mkdir -p ${pkgdir}/usr/lib/systemd/system/multi-user.target.wants/
    ln -s ../nemo-devicelock.service ${pkgdir}/usr/lib/systemd/system/multi-user.target.wants/
    ln -s ../nemo-devicelock.socket ${pkgdir}/usr/lib/systemd/system/multi-user.target.wants/
}
