## $Id$
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev (aa13q) <aa13q@ya.ru>

pkgname=nemo-qml-plugin-systemsettings-git
pkgver=0.5.47.r0.gc6e14bf
pkgrel=1
pkgdesc="System settings plugin for Nemo Mobile"
arch=('x86_64' 'aarch64')
url="https://git.sailfishos.org/mer-core/nemo-qml-plugin-systemsettings"
license=('BSD')
depends=('qt5-systems' 'ssu-sysinfo-git' 'qt5-usb-moded-git' 'profiled-git' 'qt5-timed-git' 'libsailfishkeyprovider-git' 'nemo-qml-plugin-models-git' 'qt5-connman-git' 'qt5-mlite-git' 'sailfish-user-managerd-git')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://git.sailfishos.org/mer-core/nemo-qml-plugin-systemsettings.git'
        '0002-Remove-developer-mode.patch'
        '0003-Remove-broken-certificatemodel.patch'
)
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    patch -p1 --input="${srcdir}/0002-Remove-developer-mode.patch"
    patch -p1 --input="${srcdir}/0003-Remove-broken-certificatemodel.patch"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    qmake
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make INSTALL_ROOT="$pkgdir/" install
    cd "$pkgdir"
    rm -rf opt
    mkdir -p usr/lib/${pkgname}
    mv usr/libexec/* usr/lib/${pkgname}
    rm -rf usr/libexec
}
