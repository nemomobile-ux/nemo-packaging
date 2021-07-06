# $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

_host="github.com"
_project=sailfish-on-latte
_basename=mce-plugin-libhybris
_branch=master

_gitname=$_basename
pkgname=$_basename-nonandroid-git

pkgver=1.14.3.r5.g728aa72

pkgrel=1
pkgdesc="nonandroid plugin for Mode Control Entity"
arch=('x86_64' 'aarch64')
url="https://$_host/$_project/$_gitname#branch=$_branch"
license=('LGPL-2.1-only')
depends=('mce' 'glib2')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ) 2>/dev/null
}

prepare() {
  cd "${srcdir}/${pkgname}"
  git checkout nondroid
}

build() {
  cd "${srcdir}/${pkgname}"
  make ENABLE_HYBRIS_SUPPORT=n
}

package() {
  cd "${srcdir}/${pkgname}"
  mkdir -p $pkgdir/usr/lib/mce/modules
  install -m755 hybris.so $pkgdir/usr/lib/mce/modules/
}
