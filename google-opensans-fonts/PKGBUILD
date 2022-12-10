# $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <james@nulogicsystems.com>

pkgname=google-opensans-fonts
pkgver=0.1

pkgrel=1
pkgdesc="Open Sans is a humanist sans serif typeface designed by Steve Matteson, Type Director of Ascender Corp"
arch=('x86_64' 'aarch64')
url="https://github.com/nemomobile-packages/google-opensans-fonts"
license=('Apache License 2.0')
makedepends=('git')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('19b331e6bf943d3293ad597e13b005cc29f30342e34d608ddafaac1bf5e1417e')


package() {
    cd $pkgname-$pkgver
    mkdir -p "$pkgdir"/usr/share/fonts/google-opensans/ 
    cp *.ttf "$pkgdir"/usr/share/fonts/google-opensans/ 
}
 
