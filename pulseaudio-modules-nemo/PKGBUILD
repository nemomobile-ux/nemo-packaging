## $Id$
# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=pulseaudio-modules-nemo
pkgver=14.2.31
PA_MODULE_VERSION=30
pkgrel=1
pkgdesc="PulseAudio modules for Nemo"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/pulseaudio-modules-nemo"
license=('LGPLv2+')
depends=('libpulse' 'alsa-lib' 'pulseaudio')
makedepends=('meson' 'pulsecore-headers' 'check')
source=("${url}/archive/refs/tags/$pkgver.tar.gz"
    '0001-stream-restore-nemo-fix-path-for-L-usr-lib-pulseaudi.patch'
)
sha256sums=('26e0906c41d1d647c0e7d37afb99070752a3d30e6a4c281ae106888e5a0d5896'
    '10ef9e02d8238751d57c6b9631b5ef5b0b987d06055ef3ad633fa52c5cec3e4c'
)

prepare() {
    cd $pkgname-$pkgver
    echo "$(pulseaudio --version | sed 's/pulseaudio \|//').${PA_MODULE_VERSION}" > .tarball-version
    patch -p1 --input="${srcdir}/0001-stream-restore-nemo-fix-path-for-L-usr-lib-pulseaudi.patch"
}

build() {
    local meson_options=(
        -D modlibexecdir=/usr/lib/pulseaudio/modules/
    )
    meson setup --prefix=/usr --buildtype=plain $pkgname-$pkgver build  "${meson_options[@]}"
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}

