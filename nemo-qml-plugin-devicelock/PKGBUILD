## $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=nemo-qml-plugin-devicelock
pkgver=0.3.9
pkgrel=1
pkgdesc="Device lock plugin for Nemo Mobile"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/nemo-qml-plugin-devicelock"
license=('BSD-3-Clause')
depends=('nemo-qml-plugin-dbus' 'nemo-keepalive')
source=("${url}/archive/refs/tags/$pkgver.tar.gz"
	'0001-Fixup-build-on-qt6.patch'
	'0002-features-mkspecs-must-go-to-QT_INSTALL_ARCHDATA.patch'
	"nemo-devicelock.service"
	"nemo-devicelock.socket")
sha256sums=('c22e13bf00d532dfca5f5d263424f29b6dd7b7d2191e018395da3060e6afa819'
	'72cae63d6caeee23430479abaae530883d91e5412ca58668b66d8c23378e9b98'
	'c9fadd5a6bc840d75115f4cf9563d802892130759e17fd6c456c62665c426a66'
	'460a0ad1d48f16d31ee26828536ce8bc6745f37de1b1a725d6b6c0e186eabb8e'
	'cd9c280bf80a62c5a67b1369b085328ccc2886addcacd2c18eb3498f41d0fee1')

prepare() {
    cd $pkgname-$pkgver
    sed -i "s|libsystemd-daemon|libsystemd|g" ./src/nemo-devicelock/host/host.pro
    sed -i "s|libsystemd-daemon|libsystemd|g" ./src/daemon/daemon.pro
    patch -p1 --input="${srcdir}/0001-Fixup-build-on-qt6.patch"
    patch -p1 --input="${srcdir}/0002-features-mkspecs-must-go-to-QT_INSTALL_ARCHDATA.patch"
}

build() {
    cd $pkgname-$pkgver
    qmake6 "VERSION=${pkgver}"
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
