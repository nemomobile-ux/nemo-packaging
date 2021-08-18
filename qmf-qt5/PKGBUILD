# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

pkgname=qmf-qt5-git
pkgver=4.0.4.132
pkgrel=1
pkgdesc="Qt Messaging Framework (QMF) Qt5"
arch=('x86_64' 'aarch64')
url="https://github.com/sailfishos/messagingframework"
license=('BSD-3-Clause')
depends=('nemo-keepalive-git' 'buteo-syncfw' 'libaccounts-qt' 'signond')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}" 
    "0090-fix_missing_librares.patch" 
    "0091-use_std_list.patch" 
    "0092-fix_build.patch" 
    "messageserver5.service" 
    "messageserver5-accounts-check.service")

sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule update --init --recursive
  cd upstream/
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0001-Introduce-acceptUntrustedCertificates-configuration.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0002-fix-tests-installation-path.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0003-Accounts-qt-integration.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0004-Start-messageserver-on-system-startup-in-case-there-.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0005-Add-keepalive-timer-to-IMAP-IDLE-service.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0006-Use-Qt5-booster-to-save-memory.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0007-Introduce-QMailAccount-HasPersistentConnection-statu.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0008-Introduce-discovery-of-authentication-from-the-anoun.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0009-Handle-SMTP-response-504.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0010-Recreate-SSO-identity-for-smtp-in-case-of-failure.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0011-Listen-to-sync-schedule-changes-from-buteo-sync-fram.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0012-Do-AUTHENTICATE-PLAIN-in-two-stages.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0013-Prevent-push-enabled-status-to-go-out-of-sync.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0014-Add-signature-settings-in-account.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0015-Use-EightBit-encoding-instead-of-Base64-for-text-typ.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0016-Set-qmf-accountscheck-to-be-run-by-the-booster.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0017-Retrieve-message-lists-based-on-the-folder-sync-poli.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0018-Apply-folder-policy-to-always-on-connection.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0019-Allow-a-service-provided-folder-to-be-set-as-the-sta.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0020-Add-QMailMessage-CalendarCancellation-flag.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0021-Use-a-queued-connection-to-handle-accountsUpdated-si.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0022-Store-socket-in-RuntimeLocation.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0023-Handle-encoded-word-s-containing-partial-characters.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0024-Revert-Fix-bundled-zlib-detection.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0025-Revert-Use-QRandomGenerator-instead-of-qrand.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0026-Revert-Use-range-constructors-for-lists-and-sets.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0027-Revert-Adjust-to-Qt6-QMetaType-API-changes.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0028-Revert-Replace-deprecated-QString-SplitBehavior.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0029-Revert-Fix-disappearance-of-QDateTime-QDate.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0030-Revert-core5compat-addition.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0031-Adjust-qmflist-for-missing-bits-in-5.6.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0032-Revert-loadRelax.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0033-Revert-Set-PLUGIN_CLASS_NAME-in-plugin-.pro-files.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0034-Revert-Bump-version-to-6.0.0-since-we-build-against-.patch"  

  patch -p1 --input="${srcdir}/0090-fix_missing_librares.patch"
  patch -p1 --input="${srcdir}/0091-use_std_list.patch"
  patch -p1 --input="${srcdir}/0092-fix_build.patch"
}

build() {
  cd "${srcdir}/${pkgname}/upstream"
  qmake \
    QT_BUILD_PARTS+=tests \
    QMF_INSTALL_ROOT=/usr \
    DEFINES+=QMF_ENABLE_LOGGING \
    DEFINES+=MESSAGESERVER_PLUGINS \
    DEFINES+=QMF_NO_MESSAGE_SERVICE_EDITOR \
    DEFINES+=QMF_NO_WIDGETS \
    DEFINES+=USE_ACCOUNTS_QT \
    DEFINES+=USE_KEEPALIVE \
    DEFINES+=USE_HTML_PARSER \
    CONFIG+=syslog
  make
}

package() {
  cd "${srcdir}/${pkgname}/upstream"
  make -j 1 INSTALL_ROOT="${pkgdir}" install
  rm "${pkgdir}/usr/lib/systemd/user/messageserver5.service"
  rm "${pkgdir}/usr/lib/systemd/user/messageserver5-accounts-check.service"
 
  cp ${srcdir}/messageserver5.service "${pkgdir}/usr/lib/systemd/user/messageserver5.service"
  cp ${srcdir}/messageserver5-accounts-check.service "${pkgdir}/usr/lib/systemd/user/messageserver5-accounts-check.service"
  
  mkdir -p ${pkgdir}/usr/lib/systemd/user/graphical-session.target.wants/
  ln -s ../messageserver5.service ${pkgdir}/usr/lib/systemd/user/graphical-session.target.wants/
  ln -s ../messageserver5-accounts-check.service ${pkgdir}/usr/lib/systemd/user/graphical-session.target.wants/
}