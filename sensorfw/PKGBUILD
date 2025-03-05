## $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=sensorfw
pkgver=0.15.0
pkgrel=1
pkgdesc="Sensor Framework provides an interface to hardware sensor drivers through logical sensors"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/sensorfw"
license=('LGPLv2')
depends=('libngf' 'libiphb' 'mlite6')
makedepends=('doxygen' 'qt6-base')
source=("${url}/archive/refs/tags/$pkgver.tar.gz"
    "sensorfwd.service")
sha256sums=('9b9e08e2877b01b15dc2c09cd0a84b38c854a921d6e9fe937553c59667fed9b6'
    '1fd8fb7c0f073b562957b10ee6351137c612f8250eaf64bffe72328bf60641d3'
)

prepare() {
    cd $pkgname-$pkgver
    sed "s=@LIB@=lib=g" sensord-qt6.pc.in > sensord-qt6.pc
    sed "s=@LIBDIR@=/usr/lib=g" tests/tests.xml.in > tests/tests.xml
    unset LD_AS_NEEDED
    export LD_RUN_PATH=/usr/lib/sensord-qt6/
}

build() {
    cd $pkgname-$pkgver
    qmake6 \
    CONFIG+=mce\
    PC_VERSION=`echo $pkgver | sed 's/+.*//'`
    make
}

package() {
    cd $pkgname-$pkgver
    make -j 1 INSTALL_ROOT="$pkgdir/" install
    mv $pkgdir/usr/sbin/* $pkgdir/usr/bin/
    rm -rf $pkgdir/usr/sbin/

    mkdir -p $pkgdir/usr/lib/systemd/system/graphical.target.wants
    cp ${srcdir}/sensorfwd.service $pkgdir/usr/lib/systemd/system/
    ln -s ../sensorfwd.service $pkgdir/usr/lib/systemd/system/graphical.target.wants
}
