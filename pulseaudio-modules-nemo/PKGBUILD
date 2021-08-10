## $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=pulseaudio-modules-nemo
pkgver=14.2.30.r0.gd0dfdc3
pkgrel=2
pkgdesc="PulseAudio modules for Nemo"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/pulseaudio-modules-nemo"
license=('LGPLv2+')
depends=('libpulse' 'alsa-lib' 'pulseaudio')
makedepends=('git' 'automake' 'autoconf' 'pulsecore-headers' 'check')
source=("${pkgname}::git+${url}"  "0001-fix_build.patch")
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  ( set -o pipefail
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  ) 2>/dev/null
}

prepare() {
    cd "${srcdir}/${pkgname}"
    patch -p1 --input="${srcdir}/0001-fix_build.patch"
    ./bootstrap.sh
}

build() {
  cd "${srcdir}/${pkgname}"
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --disable-static
    make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install

  install -d ${pkgdir}/usr/include/pulsecore/modules/meego
  install -m 644 src/common/include/meego/*.h ${pkgdir}/usr/include/pulsecore/modules/meego
  install -m 644 src/voice/module-voice-api.h ${pkgdir}/usr/include/pulsecore/modules/meego
  install -m 644 src/music/module-music-api.h ${pkgdir}/usr/include/pulsecore/modules/meego
  install -m 644 src/record/module-record-api.h ${pkgdir}/usr/include/pulsecore/modules/meego
  install -d ${pkgdir}/usr/include/pulsecore/modules/sailfishos
  install -m 644 src/common/include/sailfishos/*.h ${pkgdir}/usr/include/pulsecore/modules/sailfishos
  install -d ${pkgdir}/usr/lib/pkgconfig
  install -m 644 src/common/*.pc ${pkgdir}/usr/lib/pkgconfig

}
 
