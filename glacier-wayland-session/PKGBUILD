## $Id$
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=glacier-wayland-session
pkgver=0.1
pkgrel=1
pkgdesc="Glacier Wayland session"
arch=('x86_64' 'aarch64')
url="https://github.com/nemo-packaging/glacier-wayland-session"
license=('GPL-3.0-or-later')
depends=('lipstick-glacier-home-git')
makedepends=()
optdepends=()
source=("glacier.desktop" "glacier.sh")
sha512sums=('6a05f5ab14dd9bfa8366ff9e9acbe6443373fbdca22eb3ddbe6ccb57ff19835cfc312ab89fd6dfe91e1e8cc757d12b52c8a71172bac35775f132a5a6ec6be5a9'
'1ef1bfb520a4b03c07698d478b69c1ca805cac31d33dd46f0091571be94a204f92a4cb215476b44c03dbac2d32cb08a5c8cb9ebcff5c46e5f742c3e928eed02c')

package() {
    install -Dm755 "$srcdir"/glacier.sh \
        "$pkgdir"/usr/bin/glacier
    install -Dm755 "$srcdir"/glacier.desktop \
       "$pkgdir"/usr/share/wayland-sessions/glacier.desktop
}
 
