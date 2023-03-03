## $Id$
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=ngfd
pkgver=1.4.0
pkgrel=2
pkgdesc="Non-Graphic Feedback daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/ngfd"
license=('GPL')
depends=('ohm-plugins-misc'
	'libpulse' 'pulseaudio'
	'profiled'
	'libcanberra'
	'gstreamer'
	'mce'
	'mce-headers')

makedepends=('git' 'doxygen')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('362bdb041deb4c4ce9aecc7932849ff071f022580ebc4cd68a6db326032c4687')

prepare() {
    cd $pkgname-$pkgver
    rm -rf dbus-gmain
    git clone https://github.com/sailfishos-mirror/dbus-glib.git dbus-gmain
    cd dbus-gmain
    git reset --hard d42176ae4763e5288ef37ea314fe58387faf2005
}


build() {
    cd $pkgname-$pkgver
    ./autogen.sh --enable-debug\
	--prefix=/usr
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir/" install

    rm -f ${pkgdir}/usr/lib/systemd/user/ngfd.service
    mkdir -p ${pkgdir}/usr/lib/systemd/user/
    cp rpm/ngfd.service ${pkgdir}/usr/lib/systemd/user/ngfd.service
    mkdir -p ${pkgdir}/usr/lib/systemd/user/user-session.target.wants
    ln -s ../ngfd.service ${pkgdir}/usr/lib/systemd/user/user-session.target.wants

    # fix dbus config path
    mkdir -p ${pkgdir}/etc/dbus-1/system.d
    mv ${pkgdir}/usr/etc/dbus-1/system.d/ngfd.conf ${pkgdir}/etc/dbus-1/system.d/ngfd.conf
    rm -rf ${pkgdir}/usr/etc/dbus-1/system.d

    # remove tests
    rm -rf ${pkgdir}/opt

    #remove default config plz use ngfd-settings-nemo packages for it
    rm -rf ${pkgdir}/usr/share/ngfd
}
