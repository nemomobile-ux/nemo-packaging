## $Id$

pkgname=ngfd-git
pkgver=1.3.1.r0.g2f46e0b
pkgrel=2
pkgdesc="Non-Graphic Feedback daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/ngfd"
license=('GPL')
depends=('ohm-plugins-misc'
	'libpulse' 'pulseaudio'
	'profiled-git'
	'libcanberra'
	'gstreamer'
	'mce'
	'mce-headers-git')

makedepends=('git' 'doxygen')
provides=("${pkgname%-git}")
source=("${pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
    cd "$srcdir/${pkgname}"
    git submodule update --init --recursive
}


build() {
    cd "$srcdir/${pkgname}"
    ./autogen.sh --enable-debug
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/${pkgname}"
    make DESTDIR="$pkgdir/" install

    rm -f ${pkgdir}/usr/lib/systemd/user/ngfd.service
    mkdir -p ${pkgdir}/usr/lib/systemd/user/
    cp ${srcdir}/${pkgname}/rpm/ngfd.service ${pkgdir}/usr/lib/systemd/user/ngfd.service
    mkdir -p ${pkgdir}/usr/lib/systemd/user/graphical-session.target.wants
    ln -s ../ngfd.service ${pkgdir}/usr/lib/systemd/user/graphical-session.target.wants

    # fix dbus config path
    mkdir -p ${pkgdir}/etc/dbus-1/system.d
    mv ${pkgdir}/usr/etc/dbus-1/system.d/ngfd.conf ${pkgdir}/etc/dbus-1/system.d/ngfd.conf
    rm -rf ${pkgdir}/usr/etc/dbus-1/system.d

    # remove tests
    rm -rf ${pkgdir}/opt

    #remove default config plz use ngfd-settings-nemo packages for it
    rm -rf ${pkgdir}/usr/share/ngfd
}
