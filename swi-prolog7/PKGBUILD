# Maintainer: Nikolaos Bezirgiannis <bezeria@gmail.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jachym Barvinek <jachymb@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: John Proctor <jproctor@prium.net>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=swi-prolog7
pkgver=7.6.4
pkgrel=1
pkgdesc='Prolog environment (latest git stable version)'
arch=('x86_64' 'i686' 'aarch64')
url='http://www.swi-prolog.org/'
license=('GPL' 'LGPL')
depends=('gmp' 'readline' 'openssl' 'libarchive')
makedepends=('git' 'libxft' 'libjpeg' 'unixodbc' 'libxpm' 'libxinerama')
optdepends=('unixodbc: for using the odbc4pl library'
            'libjpeg: for using the pl2xpce library'
            'libxpm: for using the pl2xpce library'
            'libxinerama: for using the pl2xpce library'
            'libxft: for using the pl2xpce library'
            'java-environment: for interfacing java with the jpl package')
#options=('!makeflags')
source=("git://github.com/SWI-Prolog/swipl")
sha256sums=('SKIP')
conflicts=('swi-prolog')

prepare() {
  cd "$srcdir/swipl"
  # fix submodules url
  git checkout V${pkgver}
  sed -i -e 's,\.\.,git://github.com/SWI-Prolog,g' .gitmodules
  git submodule update --init
}

build() {
  cd "${srcdir}/swipl/src"

  autoheader
  autoconf

  echo "warn" > .doc-action
  
  ./configure --prefix=/usr \
    --disable-static        \
    --enable-shared
    
  make
}

package() {
  cd "${srcdir}/swipl/src"
  make DESTDIR="$pkgdir" install

  _tag=$(git describe --abbrev=0 --tags | sed -r 's/^V//g')

  # Fix for FS#20873
  chmod +x "$pkgdir/usr/lib/swipl-${_tag}/library/dialect/sicstus/swipl-lfr.pl"
}

