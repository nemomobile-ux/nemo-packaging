pkgbase=presage2-lang
pkgname=("${pkgbase}-de_DE"
                        "${pkgbase}-en_US"
                        "${pkgbase}-es_ES"
                        "${pkgbase}-et_EE"
                        "${pkgbase}-fi_FI"
                        "${pkgbase}-hu_HU"
                        "${pkgbase}-ru_RU"
                        "${pkgbase}-sv_SE")
pkgver=22.01.01
pkgrel=1
pkgdesc="Presage language support for"
arch=('any')
depends=("presage2")
url="https://github.com/sailfish-keyboard/presage-database"

license=('Apache-2.0 License')
source=("${url}/archive/$pkgver/prestrage-database--$pkgver.tar.gz")
sha256sums=('815b1e2e00a0b9e58f5954f1489710f2f76dd82a0efa7cb8638f40404ee5b57e')

package_presage2-lang-de_DE() {
    pkgdesc="${_desc} German"

    mkdir -p $pkgdir/usr/share/presage/
    cp -R presage-database-${pkgver}/databases/database_de_DE $pkgdir/usr/share/presage/
}

package_presage2-lang-en_US() {
    pkgdesc="${_desc} English US"

    mkdir -p $pkgdir/usr/share/presage/
    cp -R presage-database-${pkgver}/databases/database_en_US $pkgdir/usr/share/presage/
}

package_presage2-lang-es_ES() {
    pkgdesc="${_desc} Spanish (or Castilian)"

    mkdir -p $pkgdir/usr/share/presage/
    cp -R presage-database-${pkgver}/databases/database_es_ES $pkgdir/usr/share/presage/
}

package_presage2-lang-et_EE() {
    pkgdesc="${_desc} Estonian"

    mkdir -p $pkgdir/usr/share/presage/
    cp -R presage-database-${pkgver}/databases/database_et_EE $pkgdir/usr/share/presage/
}

package_presage2-lang-fi_FI() {
    pkgdesc="${_desc} Finnish"

    mkdir -p $pkgdir/usr/share/presage
    cp -R presage-database-${pkgver}/databases/database_fi_FI $pkgdir/usr/share/presage/
}

package_presage2-lang-hu_HU() {
    pkgdesc="${_desc} Hungarian"

    mkdir -p $pkgdir/usr/share/presage/
    cp -R presage-database-${pkgver}/databases/database_hu_HU $pkgdir/usr/share/presage/
}

package_presage2-lang-ru_RU() {
    pkgdesc="${_desc} Russian"

    mkdir -p $pkgdir/usr/share/presage/
    cp -R presage-database-${pkgver}/databases/database_ru_RU $pkgdir/usr/share/presage/
}

package_presage2-lang-sv_SE() {
    pkgdesc="${_desc} Swedish"

    mkdir -p $pkgdir/usr/share/presage/
    cp -R presage-database-${pkgver}/databases/database_sv_SE $pkgdir/usr/share/presage/
}
