## $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=nemo-qml-plugin-devicelock
pkgver=0.3.8
pkgrel=1
pkgdesc="Device lock plugin for Nemo Mobile"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/nemo-qml-plugin-devicelock"
license=('BSD-3-Clause')
depends=('nemo-qml-plugin-dbus' 'nemo-keepalive')
source=("${url}/archive/refs/tags/$pkgver.tar.gz"
	"nemo-devicelock.service"
	"nemo-devicelock.socket")
sha256sums=('34f15fbfebba912579e07d013ef695712560e86d85002ca9a519be194a82900a'
	'460a0ad1d48f16d31ee26828536ce8bc6745f37de1b1a725d6b6c0e186eabb8e'
	'cd9c280bf80a62c5a67b1369b085328ccc2886addcacd2c18eb3498f41d0fee1')

prepare() {
    cd $pkgname-$pkgver
    sed -i "s|libsystemd-daemon|libsystemd|g" ./src/nemo-devicelock/host/host.pro
    sed -i "s|libsystemd-daemon|libsystemd|g" ./src/daemon/daemon.pro
}

build() {
    cd $pkgname-$pkgver
    qmake "VERSION=${pkgver}"
    make
}

package() {
    cd $pkgname-$pkgver
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
