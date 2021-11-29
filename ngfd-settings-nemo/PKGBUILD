## $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=ngfd-settings-nemo
pkgver=0.3.3
pkgrel=1
pkgdesc="NGFD configuration for Nemo"
arch=('any')
url="https://github.com/nemomobile-ux/ngfd-settings-nemo"
license=('LGPL-2.0')
depends=('ngfd' 'nemo-theme-glacier')
makedepends=('git')
source=(
  "${pkgname}::git+${url}"
)
sha256sums=('SKIP')

package() {
    mkdir -p "$pkgdir"/usr/share/ngfd/events.d/
    mkdir -p "$pkgdir"/usr/share/ngfd/plugins.d/

    install -m 644 ${srcdir}/${pkgname}/data/ngfd.ini ${pkgdir}/usr/share/ngfd/
    install -m 644 ${srcdir}/${pkgname}/data/events.d/* ${pkgdir}/usr/share/ngfd/events.d/
    install -m 644 ${srcdir}/${pkgname}/data/plugins.d/* ${pkgdir}/usr/share/ngfd/plugins.d/
}
