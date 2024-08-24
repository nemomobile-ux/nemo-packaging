# Maintainer: Jerome Leclanche <jerome@leclan.ch>

pkgname=ofono
pkgver=1.34
pkgrel=5
pkgdesc="Infrastructure for building mobile telephony (GSM/UMTS) applications"
url="https://github.com/neochapay/ofono-new"
arch=('x86_64' 'aarch64')
license=("GPL2")
makedepends=('git')
depends=("bluez"
	"dbus"
	'dbus-glib'
	"modemmanager"
	"glib2"
	"udev"
	"mobile-broadband-provider-info"
	"libglibutil>=1.0.51"
	"libwspcodec"
	"libdbuslog")
source=("${pkgname}::git+${url}"
	"ofono.conf"
	"dbusaccess.conf"
	'0001-avoid-incompatible-pointer-type-error-message.patch'
	)
sha256sums=('SKIP'
	    'f166196e9794f906911de63c8290e13315d741de860040d628b20486408ac850'
	    '95a847dc79a2032835f01dad4a76bcdb163537a4b2287e750e13bc6c25ff98e5'
	    'a9813153a50105b6bb7a44211c6320e13098aa734aa73ef706730c00942feb52'
)

prepare() {
    cd "${srcdir}/${pkgname}/ofono"
    git checkout branch-1.34-qmi
    ./bootstrap
    patch -p2 --input="${srcdir}/0001-avoid-incompatible-pointer-type-error-message.patch"
}


build() {
    cd "${srcdir}/${pkgname}/ofono"
    #unset CFLAGS CXXFLAGS CPPFLAGS LDFLAGS
    autoreconf -fi
    ./configure \
	--prefix=/usr \
	--sysconfdir=/etc \
	--sbindir=/usr/bin \
	--localstatedir=/var \
	--with-systemdunitdir=/usr/lib/systemd/system \
	--enable-test \
	--enable-sailfish-bt \
	--enable-sailfish-debuglog \
	--enable-sailfish-provision \
	--enable-sailfish-pushforwarder \
	--disable-add-remove-context \
	--disable-isimodem \
	--enable-qmimodem \
	--disable-rilmodem \
	--disable-bluez4 \
	--enable-tools

    make
}

package() {
    cd "${srcdir}/${pkgname}/ofono"
    make DESTDIR="$pkgdir" install
    rm ${pkgdir}/etc/dbus-1/system.d/ofono.conf
    cp ${srcdir}/ofono.conf ${pkgdir}/etc/dbus-1/system.d/ofono.conf
    mkdir -p ${pkgdir}/etc/ofono/
    cp ${srcdir}/dbusaccess.conf ${pkgdir}/etc/ofono/
}
