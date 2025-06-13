## $Id$
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=ngfd
pkgver=1.4.10
pkgrel=1
pkgdesc="Non-Graphic Feedback daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/ngfd"
license=('GPL')
depends=('libpulse'
	'pulseaudio'
	'profiled'
	'libcanberra'
	'gstreamer'
	'mce'
	'mce-headers')

makedepends=('git' 'doxygen' 'check')
source=("${url}/archive/refs/tags/$pkgver.tar.gz"
    '0002-remove_ohm.patch'
)
sha256sums=('37a0cf47113340c2abd44da32b44697fd71a720e7cbd716c1bb298bd1761d253'
    '591cf1a0e37da056d3832c81f0114692df02910060755ace34f4dc6391edea7c'
)

prepare() {
    cd $pkgname-$pkgver
    rm -rf dbus-gmain
    git clone https://github.com/sailfishos-mirror/dbus-glib.git dbus-gmain
    cd dbus-gmain
    git reset --hard d42176ae4763e5288ef37ea314fe58387faf2005
    cd ..

    patch -p1 --input="${srcdir}/0002-remove_ohm.patch"
}


build() {
    cd $pkgname-$pkgver
    ./autogen.sh --enable-debug \
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
