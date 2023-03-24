# $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

_basename=mce-plugin-libhybris
pkgname=$_basename-nonandroid
pkgver=1.14.4

pkgrel=1
pkgdesc="nonandroid plugin for Mode Control Entity"
arch=('x86_64' 'aarch64')
url="https://github.com/mer-hybris/mce-plugin-libhybris"
license=('LGPL-2.1-only')
depends=('mce' 'glib2')

source=("${url}/archive/refs/tags/$pkgver.tar.gz"
    "0001-add_debian_build.patch"
    "0002-add_breath_type_quirk.patch")
sha256sums=('5415d2e35615285b62b5805e3d3517d05bf6c04e703d52ea53a680ea95215f84'
    '274b3e1eafef33e1619f217d97bc3a1f5d4205df9db6088704b7ea1d0262ba08'
    '25d71c43cd4487d4da21beab1cd530842c89e4cd9b6b2e71b8d1c7b127035036')

prepare() {
  cd $_basename-$pkgver
  patch -p1 --input="${srcdir}/0001-add_debian_build.patch"
  patch -p1 --input="${srcdir}/0002-add_breath_type_quirk.patch"
}

build() {
  cd $_basename-$pkgver
  make ENABLE_HYBRIS_SUPPORT=n
}

package() {
  cd $_basename-$pkgver
  make install DESTDIR=$pkgdir
}