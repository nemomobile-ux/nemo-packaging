## $Id$
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=profiled-settings-nemo
pkgver=0.2.r0.ge855b34
pkgrel=1
pkgdesc="profiled configuration for Nemo"
arch=('x86_64' 'aarch64')
url="https://github.com/nemomobile-ux/profiled-settings-nemo"
license=('LGPL-2.0-or-later')
makedepends=('git')
provides=("${pkgname%-git}")
source=(
  "${pkgname}::git+${url}"
)
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ) 2>/dev/null
}

package() {
    mkdir -p "$pkgdir"/etc/profiled
    cp ${srcdir}/${pkgname}/ini/10.meego-default.ini ${pkgdir}/etc/profiled/10.meego-default.ini
}

