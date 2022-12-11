## $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=pulseaudio-modules-nemo
pkgver=16.1
pkgrel=1
pkgdesc="PulseAudio modules for Nemo"
arch=('x86_64' 'aarch64')
url="https://github.com/nemomobile-ux/pulseaudio-modules-nemo"
license=('LGPLv2+')
depends=('libpulse' 'alsa-lib' 'pulseaudio')
makedepends=('automake' 'autoconf' 'pulsecore-headers' 'check')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a48b016367d4876895b2084b1b70170266c49a5541302026437efc2959d2286e')

prepare() {
    cd $pkgname-$pkgver
    pulseaudio --version | sed 's/pulseaudio \|//' > .tarball-version
}

build() {
  cd $pkgname-$pkgver
  ./bootstrap.sh --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    PULSEAUDIO_LIBS="-lpulsecore-16.1 -lpulsecommon-16.1 -L/usr/lib/pulseaudio -L/usr/lib/pulseaudio/modules/" \
    --with-module-dir=/usr/lib/pulseaudio/modules/
    make
}

package() {
  cd $pkgname-$pkgver

  mkdir -p ${pkgdir}/usr/lib/pulseaudio/modules/
  cp src/voice/.libs/module-meego-voice.so ${pkgdir}/usr/lib/pulseaudio/modules/
  cp src/record/.libs/module-meego-record.so ${pkgdir}/usr/lib/pulseaudio/modules/
  cp src/music/.libs/module-meego-music.so ${pkgdir}/usr/lib/pulseaudio/modules/
  cp src/mainvolume/.libs/module-meego-mainvolume.so ${pkgdir}/usr/lib/pulseaudio/modules/
  cp src/stream-restore-nemo/.libs/module-stream-restore-nemo.so ${pkgdir}/usr/lib/pulseaudio/modules/
  cp src/sidetone/.libs/module-meego-sidetone.so ${pkgdir}/usr/lib/pulseaudio/modules/
  cp src/test/.libs/module-meego-test.so ${pkgdir}/usr/lib/pulseaudio/modules/
  cp src/common/.libs/libmeego-common.so ${pkgdir}/usr/lib/pulseaudio/modules/
  cp src/parameters/.libs/module-meego-parameters.so ${pkgdir}/usr/lib/pulseaudio/modules/

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

