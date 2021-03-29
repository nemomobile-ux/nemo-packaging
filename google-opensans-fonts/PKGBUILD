# $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <james@nulogicsystems.com>

_host="github.com"
_project=nemomobile-packages
_basename=google-opensans-fonts
_branch=master

_gitname=$_basename
pkgname=$_basename-git

pkgver=1.1

pkgrel=1
pkgdesc="Open Sans is a humanist sans serif typeface designed by Steve Matteson, Type Director of Ascender Corp"
arch=('x86_64' 'aarch64')
url="https://$_host/$_project/$_gitname#branch=$_branch"
license=('Apache License 2.0')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}")
md5sums=('SKIP')


package() {
    cd "${srcdir}/${pkgname}"
    mkdir -p "$pkgdir"/usr/share/fonts/google-opensans/ 
    cp *.ttf "$pkgdir"/usr/share/fonts/google-opensans/ 
}
 
