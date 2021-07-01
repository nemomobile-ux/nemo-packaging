# Maintainer: Chupligin Sergey (NeoChapay) <neochapay@gmail.com>

_host="git.sailfishos.org"
_project=mer-core
_basename=messagingframework
_branch=master

_gitname=$_basename
pkgname=qmf-qt5-git

pkgver=4.0.4.131

pkgrel=1
pkgdesc="Qt Messaging Framework (QMF) Qt5"
arch=('x86_64' 'aarch64')
url="https://$_host/$_project/$_gitname"
license=('BSD-3-Clause')
depends=('nemo-keepalive-git' 'mapplauncherd-qt-git' 'buteo-syncfw' 'libaccounts-qt' 'signond')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}" "0090-fix_missing_librares.patch" "0091-use_std_list.patch")
sha256sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule update --init --recursive
  cd upstream/
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0001-Stop-_incomingDataTimer-when-imapprotocol-object-is-.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0002-Introduce-acceptUntrustedCertificates-configuration.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0003-fix-tests-installation-path.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0004-Accounts-qt-integration.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0005-Start-messageserver-on-system-startup-in-case-there-.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0006-Add-keepalive-timer-to-IMAP-IDLE-service.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0007-Use-Qt5-booster-to-save-memory.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0008-Introduce-QMailAccount-HasPersistentConnection-statu.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0009-Introduce-discovery-of-authentication-from-the-anoun.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0010-Handle-SMTP-response-504.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0011-Recreate-SSO-identity-for-smtp-in-case-of-failure.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0012-Listen-to-sync-schedule-changes-from-buteo-sync-fram.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0013-Do-AUTHENTICATE-PLAIN-in-two-stages.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0014-Prevent-push-enabled-status-to-go-out-of-sync.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0015-Check-if-IDLE-connection-needs-to-be-established-aft.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0016-Revert-Fix-bundled-zlib-detection.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0017-Add-signature-settings-in-account.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0018-Use-socket-s-local-address-for-HELO-and-EHLO-message.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0019-Use-EightBit-encoding-instead-of-Base64-for-text-typ.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0020-Follow-the-synchronizationEnabled-flag-when-folders-.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0021-Set-new-IMAP-folders-to-inherit-SynchronizationEnabl.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0022-Set-qmf-accountscheck-to-be-run-by-the-booster.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0023-Retrieve-message-lists-based-on-the-folder-sync-poli.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0024-Apply-folder-policy-to-always-on-connection.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0025-Add-missing-slash-character-as-protected-in-header-p.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0026-Handle-encoded-word-s-containing-partial-characters.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0027-Allow-a-service-provided-folder-to-be-set-as-the-sta.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0028-Add-QMailMessage-CalendarCancellation-flag.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0029-Use-a-queued-connection-to-handle-accountsUpdated-si.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0030-Support-as-specifier-for-log-file-paths.patch"
  patch -p1 --input="${srcdir}/${pkgname}/rpm/0031-Store-socket-in-RuntimeLocation.patch"
  
  patch -p1 --input="${srcdir}/0090-fix_missing_librares.patch"
  patch -p1 --input="${srcdir}/0091-use_std_list.patch"
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
  sed -i 's/WantedBy=user-session.target/WantedBy=graphical-session.target/' "${pkgdir}/usr/lib/systemd/user/messageserver5.service"
  sed -i 's/WantedBy=user-session.target/WantedBy=graphical-session.target/' "${pkgdir}/usr/lib/systemd/user/messageserver5-accounts-check.service"

}