pkgname=maliit-framework-qt6
pkgver=2.3.0
pkgrel=1
pkgdesc="Framework for Maliit"
arch=('aarch64' 'x86_64')
url="https://github.com/maliit/framework"
license=('LGPL')
depends=('qt6-declarative' 'wayland-protocols' 'qt6-wayland')
makedepends=('git' 'cmake' 'doxygen' 'graphviz')
conflicts=("maliit-framework")
source=("${url}/archive/refs/tags/$pkgver.tar.gz"
    "0001-move_to_qt6.patch")
sha256sums=('bfc23919ac8b960243f85e8228ad7dfc28d557b52182a0b5a2a216a5c6a8057c'
    '93ffe28b0cd5c97184c78f129f19d69c9087a57c065c425868aa43714d7c8845')

prepare() {
    cd framework-$pkgver
    patch -p1 --input="${srcdir}/0001-move_to_qt6.patch"
    mkdir -p build
}

build() {
    cd framework-$pkgver/build
    cmake ../ \
    -DQtWaylandScanner_EXECUTABLE:FILEPATH=/usr/lib/qt6/qtwaylandscanner \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -Denable-dbus-activation=ON \
    -Denable-docs=OFF \
    -Denable-tests=OFF \
    -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd framework-$pkgver/build
    make DESTDIR="$pkgdir/" install
    rm -f $pkgdir/usr/share/dbus-1/services/org.maliit.server.service
}
