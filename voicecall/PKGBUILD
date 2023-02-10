# $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=voicecall
pkgver=0.8.1
pkgrel=1
pkgdesc="Dialer engine for Nemo Mobile"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/voicecall"
license=('LGPL-2.1-only AND Apache-2.0')
depends=('libpulse'
	 'nemo-qml-plugin-devicelock'
	 'libresourceqt'
	 'libqofono-qt5'
	 'qt5-multimedia'
	 'libngf-qt'
	 'telepathy-qt')
makedepends=('cmake')
source=("${url}/archive/refs/tags/$pkgver.tar.gz"
	'voicecall-manager.service')
sha256sums=('f2af4f5cdc89dd658413d724a56631df11dce14f002becd3ffc5b15d36040f33'
    '2b23389872552e88b061d170271ec35c1c0cec68f38c1a770c14c79c3491fb8d')

build() {
    cd $pkgname-$pkgver
    qmake CONFIG+=enable-ngf CONFIG+=enable-audiopolicy CONFIG+=enable-telepathy CONFIG+=enable-nemo-devicelock CONFIG+=install-servicefiles
    make
}

package() {
    cd $pkgname-$pkgver
    make -j 1 INSTALL_ROOT="${pkgdir}" install

    rm "${pkgdir}/usr/lib/systemd/user/voicecall-manager.service"
    cp ${srcdir}/voicecall-manager.service "${pkgdir}/usr/lib/systemd/user/voicecall-manager.service"
    mkdir -p ${pkgdir}/usr/lib/systemd/user/graphical-session.target.wants
    ln -s ../voicecall-manager.service ${pkgdir}/usr/lib/systemd/user/graphical-session.target.wants/
}
