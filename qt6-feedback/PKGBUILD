pkgname=qt6-feedback
pkgver=0.0.0.20150918
_commit=28ca62414901502189ea28ef2efd551386187619
pkgrel=1
pkgdesc="Qt Tactile Feedback Add-on Module"
arch=('x86_64' 'aarch64')
url="https://github.com/qtproject/qtfeedback"
license=('GPL3' 'LGPL' 'FDL' 'custom')
depends=('qt6-declarative')
makedepends=('git')
source=("git+https://github.com/qtproject/qtfeedback.git#commit=$_commit"
	"0001-allow_build_with_qt6.patch"
	'qt_lib_feedback.pri'
	)
sha256sums=('SKIP'
    '2f13ac4a98e9350fe6ecbb9be284e7d7b97cee457c7f803c103e7431fe62ef1c'
    'SKIP')

prepare() {
  cd qtfeedback
  patch -Np1 -i "${srcdir}/0001-allow_build_with_qt6.patch"
}

build() {
  cd qtfeedback
  qmake6 CONFIG+=package multimedia_disabled=yes
  make
}

package() {
  cd qtfeedback

  make INSTALL_ROOT="${pkgdir}" install
  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
  mkdir -p ${pkgdir}/usr/lib/qt6/mkspecs/modules/
  cp ${srcdir}/qt_lib_feedback.pri ${pkgdir}/usr/lib/qt6/mkspecs/modules/
}
