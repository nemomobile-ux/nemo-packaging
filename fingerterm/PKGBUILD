# $Id$
# Contributor: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=fingerterm
pkgver=1.4.13
pkgrel=1
pkgdesc="fingerterm is a terminal emulator designed for touch-based interaction, specifically for (but not limited to) use on the Nokia N9 and Jolla's Jolla device."
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/fingerterm"
license=('BSD-3-Clause' 'LGPL-2.1-only')
depends=('qt6-declarative' 'qt6-5compat')
makedepends=('qt6-tools' 'clang')
source=("${url}/archive/refs/tags/$pkgver.tar.gz"
  '0001-use-lupdate-and-lrelease-from-QT_INSTALL_BINS.patch'
  '0002-Qt6-compatibility.patch'
  '0003-Changes-needed-for-qt6.patch'
  '0004-fix-linker-errors.patch'
)



sha256sums=(
    '6e6467420486fbcac4ccdc25f63966bb6da14032a8ee3d7daf1dda6e0a9355da'
    '8cf61214880725e723ece9aa23977839793a34875c98b4c57022e1156168e09a'
    '66b6800824eb27d58b66334d350c7bec57d66607994a99e5124fc0c4702ccec0'
    'ef7f082acc3d5035f2484adb356676f0265a9e0c32d58d7e4b8e2e7c3e28ad61'
    '2807bf09f3dd9f95c94c24a2f5cdd9930085d10bbb840f9345d9a11e5abdfa5a'
)

prepare() {
    cd $pkgname-$pkgver
    patch -p1 --input="${srcdir}/0001-use-lupdate-and-lrelease-from-QT_INSTALL_BINS.patch"
    patch -p1 --input="${srcdir}/0002-Qt6-compatibility.patch"
    patch -p1 --input="${srcdir}/0003-Changes-needed-for-qt6.patch"
    patch -p1 --input="${srcdir}/0004-fix-linker-errors.patch"
}

build() {
    cd $pkgname-$pkgver
    qmake6
    make
}

package() {
    cd $pkgname-$pkgver
    make -j 1 INSTALL_ROOT="$pkgdir/" install
}
