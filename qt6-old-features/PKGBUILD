# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgbase=qt6-old-features
pkgdesc="Old qt features"
pkgname=('qt6-old-features')
pkgver=0.2
pkgrel=2
url="https://github.com/nemomobile-ux"
arch=('any')
license=('GPL')
depends=('perl')
source=("https://github.com/nemomobile-ux/qt6-old-features/archive/refs/heads/master.zip")
sha256sums=(SKIP)

package() {
    cd $pkgname-master
    mkdir -p $pkgdir/usr/lib/qt6/mkspecs/features/
    mkdir -p $pkgdir/usr/lib/qt6/libexec
    mkdir -p $pkgdir/usr/lib/qt6/mkspecs/features/data/unix/

    cp features/*.prf $pkgdir/usr/lib/qt6/mkspecs/features/
    cp scripts/syncqt.pl $pkgdir/usr/lib/qt6/libexec
    cp scripts/findclasslist.pl $pkgdir/usr/lib/qt6/mkspecs/features/data/unix/
}
