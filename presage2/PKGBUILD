pkgname=presage2
pkgver=2.0.1
pkgrel=1
pkgdesc="intelligent predictive text entry system."
arch=('x86_64' 'aarch64')
url="https://github.com/neochapay/presage"

license=('Apache-2.0 License')
makedepends=('automake'
		'make'
		'tinyxml2'
		'sqlite>=3'
		'marisa'
		'hunspell>=1.5.1'
		'cppunit')
source=("${url}/archive/$pkgver/presage-$pkgver.tar.gz")
sha256sums=('02e435b980a687f16e69bec7cf1d5b07030be24662aaf50c39669a6ce9c2edad')

prepare() {
    cd "$srcdir/presage-${pkgver}"
}

build() {
    cd "$srcdir/presage-${pkgver}"
    autoreconf -fi
    export CFLAGS="$CFLAGS -fPIC"
    export CXXFLAGS="$CXXFLAGS -fPIC"
    ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --disable-python-binding \
    --disable-gpresagemate \
    --disable-gprompter \
    --disable-documentation
}

package() {
    cd "$srcdir/presage-${pkgver}"
    make DESTDIR="$pkgdir" install

    mkdir -p $pkgdir/etc
    mkdir -p $pkgdir/usr/share/presage/

    cp packaging/sailfish/presage.xml $pkgdir/etc/presage.xml
    cp packaging/sailfish/database_empty.db $pkgdir/usr/share/presage/
    cp -r packaging/sailfish/database_empty $pkgdir/usr/share/presage/

    # cleanup unneeded files
    rm -rf %{pkgdir}/usr/share/presage/abbreviations_en.txt
    rm -rf %{pkgdir}/usr/share/presage/abbreviations_it.txt
    rm -rf %{pkgdir}/usr/share/presage/database_en.db
    rm -rf %{pkgdir}/usr/share/presage/database_es.db
    rm -rf %{pkgdir}/usr/share/presage/database_it.db
    rm -rf %{pkgdir}/usr/share/presage/presage.png
    rm -rf %{pkgdir}/usr/share/presage/presage.svg
    rm -rf %{pkgdir}/usr/share/presage/presage.xpm
    rm -rf %{pkgdir}/usr/share/presage/python_binding.txt
}
