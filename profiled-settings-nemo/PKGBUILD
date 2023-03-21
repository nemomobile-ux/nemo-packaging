## $Id$
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=profiled-settings-nemo
pkgver=0.2.1
pkgrel=1
pkgdesc="profiled configuration for Nemo"
arch=('any')
url="https://github.com/nemomobile-ux/profiled-settings-nemo"
license=('LGPL-2.0-or-later')
provides=("${pkgname%-git}")
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('be6001f612140b9c240b261fb9ab0f2d2726caa6097427e9fcdeffa627b05cd2')

package() {
    mkdir -p "$pkgdir"/etc/profiled
    cp $pkgname-$pkgver/ini/10.meego-default.ini ${pkgdir}/etc/profiled/10.meego-default.ini
}
