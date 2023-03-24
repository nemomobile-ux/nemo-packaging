## $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=ngfd-settings-nemo
pkgver=0.4
pkgrel=1
pkgdesc="NGFD configuration for Nemo"
arch=('any')
url="https://github.com/nemomobile-ux/ngfd-settings-nemo"
license=('LGPL-2.0')
depends=('ngfd' 'nemo-theme-glacier')
makedepends=('git')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('68b1c67b8a3d99650568d9264433b09070ef7ddcc1a45149732d76a9252ebb6f')

package() {
    cd $pkgname-$pkgver
    mkdir -p "$pkgdir"/usr/share/ngfd/events.d/
    mkdir -p "$pkgdir"/usr/share/ngfd/plugins.d/

    install -m 644 data/ngfd.ini ${pkgdir}/usr/share/ngfd/
    install -m 644 data/events.d/* ${pkgdir}/usr/share/ngfd/events.d/
    install -m 644 data/plugins.d/* ${pkgdir}/usr/share/ngfd/plugins.d/
}
