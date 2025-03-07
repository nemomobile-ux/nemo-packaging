## $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

pkgname=libngf-qt6
pkgver=0.9.0
pkgrel=2
pkgdesc="Qt-based client library for Non-Graphic Feedback daemon"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/libngf-qt"
license=('GPL')
depends=('qt6-declarative' 'libngf' 'qt6-feedback')
source=("${url}/archive/refs/tags/$pkgver.tar.gz"
    '0001-Fixup-build-with-qt6.patch'
)
sha256sums=('5896647c64463e1b4be5bcc84e915dd1e73644e65419aa82ed41bb759e39bb4a'
    '46b74fb8554785e37f2b74c164af3c65b9c0f86912803b5c4994bdaa94a1750a'
)

prepare() {
    cd libngf-qt-$pkgver
    patch -p1 --input="${srcdir}/0001-Fixup-build-with-qt6.patch"
}

build() {
    cd libngf-qt-$pkgver
    qmake6 PREFIX=/usr "VERSION=$(sed 's/+.*//' <<<"${pkgver}")"

    # Hack for PREFIX path not being passed to src subproject for some reason
    cd src
    qmake6 PREFIX=/usr
    cd ..

    make
}

package() {
    cd libngf-qt-$pkgver
    make -j 1 INSTALL_ROOT="$pkgdir/" install
    # Remove tests
    rm -rf "$pkgdir/opt"
}
