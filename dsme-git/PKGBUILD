## $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=dsme-git
pkgver=0.83.1.r0.gd9c5940
pkgrel=1
pkgdesc="Device State Management Entity"
arch=('x86_64' 'aarch64')
url="https://git.sailfishos.org/mer-core/dsme"
license=('GPL')
depends=('libngf-git' 'libiphb-git' 'mce-git' 'cryptsetup' 'libsystemd' 'libdsme>=0.66.6' 'glib2' 'systemd' 'systemd-libs')
makedepends=('git' 'autoconf' 'automake' 'mce-headers')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://git.sailfishos.org/mer-core/dsme.git' 'fix-dsme_server_path.patch' 'dsme.service')
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    git submodule update --init --recursive
    patch -p1 --input="${srcdir}/fix-dsme_server_path.patch"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    ./autogen.sh
    ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--sbindir=/usr/bin \
	--disable-poweron-timer \
	--disable-static \
	--disable-upstart \
	--enable-runlevel \
	--enable-systemd \
	--enable-pwrkeymonitor \
	--disable-validatorlistener \
	--enable-abootsettings
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make DESTDIR="$pkgdir/" install

    mkdir -p $pkgdir/usr/lib/systemd/system/
    cp $srcdir/dsme.service $pkgdir/usr/lib/systemd/system/
}