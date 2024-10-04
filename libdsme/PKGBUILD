# Contributer Chupligin Sergey (NeoChapay) <neochapay@gmail.com>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=libdsme
pkgver=0.67.0
pkgrel=1
pkgdesc="DSME dsmesock dynamic library"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/libdsme"
license=('LGPL')
depends=('glib2')
makedepends=('check')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('58908591d652f6505cebeb126664950cf9337d70a963b2f03cd6e80e91578e46')

build() {
  cd $pkgname-$pkgver
  ./verify_version
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install_main install_devel

  # Fix symlinks
  for name in libdsme libdsme_dbus_if libthermalmanager_dbus_if; do
    ln -sf $name.so.0.3.0 "$pkgdir"/usr/lib/$name.so.0
    ln -sf $name.so.0.3.0 "$pkgdir"/usr/lib/$name.so
  done
}
