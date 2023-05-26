# $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=voicecall
pkgver=0.8.2
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
	 'telepathy-ring'
	 'telepathy-farstream'
	 'telepathy-qt')
makedepends=('cmake')
source=("${url}/archive/refs/tags/$pkgver.tar.gz"
	'voicecall-manager.service')
sha256sums=('10b31a14bc93df68d8d16373adffffe5ae3d7b9dcdcacf3f65822d44a1e28a3e'
    '61c9da6be16743334d608f19a7a7cd3d104264e3409f212078b6a60c1d628dce')

build() {
    cd $pkgname-$pkgver
    qmake CONFIG+=enable-ngf \
	CONFIG+=enable-audiopolicy \
	CONFIG+=enable-telepathy \
	CONFIG+=enable-nemo-devicelock \
	CONFIG+=install-servicefiles
    make
}

package() {
    cd $pkgname-$pkgver
    make -j 1 INSTALL_ROOT="${pkgdir}" install

    rm "${pkgdir}/usr/lib/systemd/user/voicecall-manager.service"
    cp ${srcdir}/voicecall-manager.service "${pkgdir}/usr/lib/systemd/user/voicecall-manager.service"
    mkdir -p ${pkgdir}/usr/lib/systemd/user/user-session.target.wants
    ln -s ../voicecall-manager.service ${pkgdir}/usr/lib/systemd/user/user-session.target.wants/
}
