# $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=nemo-qml-plugin-settings
pkgver=0.1.2
pkgrel=1
pkgdesc="Nemomobile QML wrapper for QSettings class"
arch=('x86_64' 'aarch64')
url="https://github.com/nemomobile-ux/nemo-qml-plugin-settings"
license=('LGPL-2.0-or-later')
depends=('qt6-declarative')
makedepends=('cmake')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('203c4c79d8c4140190fb79f263c07fda5cde7b4cf78f5681e8cddf86cdf6662f')

build() {
    cd $pkgname-$pkgver
    cmake -DCMAKE_INSTALL_PREFIX:PATH='/usr' .
    make all
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
