## $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=sensorfw
pkgver=0.14.2
pkgrel=1
pkgdesc="Sensor Framework provides an interface to hardware sensor drivers through logical sensors"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/sensorfw"
license=('LGPLv2')
depends=('libngf' 'libiphb' 'mlite')
makedepends=('doxygen')
source=("${url}/archive/refs/tags/$pkgver.tar.gz"
    "sensorfwd.service")
sha256sums=('08b494aa4a9d07fe643354f5943d2430b543958d8697ff10951e43860c5d525e'
    '1fd8fb7c0f073b562957b10ee6351137c612f8250eaf64bffe72328bf60641d3')

prepare() {
    cd $pkgname-$pkgver
    sed "s=@LIB@=lib=g" sensord-qt5.pc.in > sensord-qt5.pc
    sed "s=@LIBDIR@=/usr/lib=g" tests/tests.xml.in > tests/tests.xml
    unset LD_AS_NEEDED
    export LD_RUN_PATH=/usr/lib/sensord-qt5/
}

build() {
    cd $pkgname-$pkgver
    qmake \
    CONFIG+=mce\
    PC_VERSION=`echo $pkgver | sed 's/+.*//'`
    make
}

package() {
    cd $pkgname-$pkgver
    make -j 1 INSTALL_ROOT="$pkgdir/" install
    mv $pkgdir/usr/sbin/* $pkgdir/usr/bin/
    rm -rf $pkgdir/usr/sbin/

    # move *.prf into right folder
    mkdir -p ${pkgdir}/usr/lib/qt/mkspecs/features/
    mv ${pkgdir}/usr/share/qt5/mkspecs/features/sensord.prf ${pkgdir}/usr/lib/qt/mkspecs/features/sensord.prf

    mkdir -p $pkgdir/usr/lib/systemd/system/graphical.target.wants
    cp ${srcdir}/sensorfwd.service $pkgdir/usr/lib/systemd/system/
    ln -s ../sensorfwd.service $pkgdir/usr/lib/systemd/system/graphical.target.wants
}
