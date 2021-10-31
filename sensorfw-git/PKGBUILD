## $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=sensorfw-git

pkgver=0.12.5.r0.gd51730b
pkgrel=1
pkgdesc="Sensor Framework provides an interface to hardware sensor drivers through logical sensors"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/sensorfw"
license=('LGPLv2')
depends=('libngf-git' 'libiphb-git' 'mlite')
makedepends=('git' 'doxygen')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}" "sensorfwd.service")
md5sums=('SKIP' 'SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname}"
    sed "s=@LIB@=/usr/lib=g" sensord-qt5.pc.in > sensord-qt5.pc
    sed "s=@LIBDIR@=/usr/lib=g" tests/tests.xml.in > tests/tests.xml
    unset LD_AS_NEEDED
    export LD_RUN_PATH=/usr/lib/sensord-qt5/
}

build() {
    cd "${srcdir}/${pkgname}"
    qmake \
    CONFIG+=mce\
    PC_VERSION=`echo $pkgver | sed 's/+.*//'`
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    make -j 1 INSTALL_ROOT="$pkgdir/" install
    mv $pkgdir/usr/sbin/* $pkgdir/usr/bin/
    rm -rf $pkgdir/usr/sbin/

    mkdir -p $pkgdir/usr/lib/systemd/system/graphical.target.wants
    cp ${srcdir}/sensorfwd.service $pkgdir/usr/lib/systemd/system/
    ln -s ../sensorfwd.service $pkgdir/usr/lib/systemd/system/graphical.target.wants
}
