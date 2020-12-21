## $Id$
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=lipstick-glacier-home-git
_host="github.com"
_project=nemomobile-ux
_branch=devel
pkgver=0.27.8.r184.g559d595
pkgrel=1
pkgdesc="A nice homescreen for Glacier experience"
arch=('x86_64' 'aarch64')
url="https://$_host/$_project/glacier-home#branch=$_branch"
license=('BSD-3-Clause AND MIT')
depends=('bluez-qt' 'qt5-graphicaleffects' 'qt5-multimedia' 'qt5-feedback' 'qt5-mpris-git' 'nemo-qml-plugin-contextkit-git' 'qt5-lipstick-git' 'qt5-quickcontrols-nemo-git' 'nemo-qml-plugin-configuration-git' 'nemo-qml-plugin-statusnotifier-git' 'nemo-qml-plugin-time-git' 'nemo-qml-plugin-contacts-git' 'nemo-qml-plugin-notifications-git' 'qt5-ofono-nemo-extensions-git')
makedepends=('git' 'extra-cmake-modules' 'qt5-wayland' 'qt5-tools' 'nemo-qml-plugin-devicelock' 'bluez-qt')
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}" "fix-compilation-errors.patch" "cmake-support.patch" "bluez-api-fixes.patch")
sha512sums=('SKIP'
'929fb46bee14f1464c21df5f466cf88598bc1273ef61d446aad176d1a114e5f0c158189aaa0e6a4e74bcb34ae3f29f07dd8bb41314203bb3cbb4777045e4e169'
'f775c560500c72f8fd88d5393d2e077af026c94886c47bded615765711ea86dc19756249157a9f89fc12cf882e4c552e9902bd16a370a7028b962fb944d3e67f'
'894ad07a0276bee59e41d12c9f7ca0bc49221f48d33769e4786923e48c6999055f208368e7bd8188ecde8db0af8b7f9215abefdbdc9591dc44297cef5ac245a2')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ) 2>/dev/null
}

prepare() {
    cd "${srcdir}/${pkgname}"
    patch -p1 --input="${srcdir}/fix-compilation-errors.patch"
    patch -p1 --input="${srcdir}/cmake-support.patch"
    patch -p1 --input="${srcdir}/bluez-api-fixes.patch"
}

build() {
  cd "${srcdir}/${pkgname}"
  cmake -B build \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc
  make -C build
}

package() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="$pkgdir" make -C build install
}
 
