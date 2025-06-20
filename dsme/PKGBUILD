## $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=dsme
pkgver=0.84.7
pkgrel=1
pkgdesc="Device State Management Entity"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/dsme"
license=('GPL')
depends=('libngf' 'libiphb' 'mce' 'cryptsetup' 'libsystemd' 'libdsme>=0.66.6' 'glib2' 'systemd' 'systemd-libs')
makedepends=('git' 'autoconf' 'automake' 'mce-headers')
source=("${url}/archive/refs/tags/$pkgver.tar.gz"
	'fix-dsme_server_path.patch'
	'dsme.service')
sha256sums=('b807e269687348f18bd71b7092ede441658e05ac4eb5b51b5b3cd6cde2d15e14'
	'4db9158b9a866eed11139c6bb70cd1de2f4f7fd289c7f2187181063cad5abaeb'
	'8da87f608944b52c009c3734f491538d7206a61d5876c064958e3f5f225e83b4')

prepare() {
    cd $pkgname-$pkgver
    rm -rf dbus-gmain
    git clone https://github.com/sailfishos-mirror/dbus-glib.git dbus-gmain
    cd dbus-gmain
    git reset --hard d42176ae4763e5288ef37ea314fe58387faf2005
    cd ../
    patch -p1 --input="${srcdir}/fix-dsme_server_path.patch"
}

build() {
    cd $pkgname-$pkgver
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
	--enable-abootsettings \
	--enable-usewheel
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir/" install

    mkdir -p $pkgdir/var/lib/dsme
    mkdir -p $pkgdir/usr/lib/systemd/system/
    cp $srcdir/dsme.service $pkgdir/usr/lib/systemd/system/
#Remove tests
    rm -rf $pkgdir/opt
}
