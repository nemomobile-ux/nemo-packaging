# Maintainer: Jan Alexander Steffens (heftig) <hef...@archlinux.org>
# Contributor: György Balló <ball...@freestart.hu>
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=geoclue1
pkgver=0.12.99.8
_gitver=2
pkgrel=2
pkgdesc="Modular geoinformation service built on the D-Bus messaging system"
arch=('x86_64' 'aarch64')
url="https://www.freedesktop.org/wiki/Software/GeoClue/";
license=(LGPL)
depends=(glib2 libxml2 dbus-glib libsoup)
makedepends=(libxslt python)
provides=(geoclue)
conflicts=(geoclue)
source=("https://github.com/sailfishos/geoclue/archive/refs/tags/${pkgver}+git${_gitver}.tar.gz")
sha256sums=('21218623bf0c5375b7eaf94eee4efc68c351f115c4d1629dfea49dfe090be539')

prepare() {
    cd $srcdir/geoclue-${pkgver}-git${_gitver}/geoclue
    autoreconf -vfi
}

build() {
    cd $srcdir/geoclue-${pkgver}-git${_gitver}/geoclue
    CFLAGS="-Wno-format-security" ./configure \
	--prefix=/usr \
	--libexecdir=/usr/lib \
	--enable-static=no \
	--enable-connman=no \
	--enable-gpsd=no
    make
}

package() {
    cd $srcdir/geoclue-${pkgver}-git${_gitver}/geoclue
    make DESTDIR=$pkgdir install
}
