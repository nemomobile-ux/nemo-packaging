# $Id$
# Contributor: TheKit <nekit1000 at gmail.com>
# Contributor: Bart Ribbers <bribbers@disroot.org>
# Contributor: Alexey Andreyev <aa13q@ya.ru>
# Maintainer: James Kittsmiller (AJSlye) <james@nulogicsystems.com>

_host="github.com"
_project=nemomobile-ux
_basename=nemo-theme-glacier
_branch=master

_gitname=$_basename
pkgname=$_basename-git

pkgver=0.2.r0.g34159f3

pkgrel=1
pkgdesc="Glacier theme based on nemo-theme-default"
arch=('x86_64' 'aarch64')
url="https://$_host/$_project/$_gitname#branch=$_branch"
license=('CC-BY-SA-3.0')    
makedepends=('git')
provides=("${pkgname%-git}" "nemo-theme-default")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${pkgname}"
    mkdir -p \
        "$pkgdir"/usr/share/themes/glacier/meegotouch/icons \
        "$pkgdir"/usr/share/themes/glacier/fontawesome/icons \
        "$pkgdir"/usr/share/sounds/glacier/stereo

    cp icons/fontawesome/* "$pkgdir"/usr/share/themes/glacier/fontawesome/icons/
    cp icons/meegotouch/* "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/
    cp index.theme "$pkgdir"/usr/share/themes/glacier/

    cp sounds/glacier/stereo/* "$pkgdir"/usr/share/sounds/glacier/stereo/

    ln -rsf "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-app-terminal.png "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-l-terminal.png
    ln -rsf "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-app-settings.png "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-l-settings.png
    ln -rsf "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-app-screenshot.png "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-launcher-screenshot.png
    ln -rsf "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-app-browser.png "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-launcher-browser.png
    ln -rsf "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-app-calculator.png "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-launcher-calculator.png
    ln -rsf "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-app-calendar.png "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-launcher-calendar.png
    ln -rsf "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-app-camera.png "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-launcher-camera.png
    ln -rsf "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-app-clock.png "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-launcher-clock.png
    ln -rsf "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-app-email.png "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-launcher-email.png
    ln -rsf "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-app-gallery.png "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-launcher-gallery.png
    ln -rsf "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-app-music.png "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-launcher-mediaplayer.png
    ln -rsf "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-app-conversation.png "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-launcher-messaging.png
    ln -rsf "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-app-notes.png "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-launcher-notes.png
    ln -rsf "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-app-documents.png "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-launcher-office.png
    ln -rsf "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-app-contacts.png "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-launcher-people.png
    ln -rsf "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-app-dialer.png "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-launcher-phone.png
    ln -rsf "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-app-settings.png "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-launcher-settings.png
    ln -rsf "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-app-terminal.png "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-launcher-shell.png
    ln -rsf "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-app-packages.png "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-launcher-store.png
    ln -rsf "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-app-weather.png "$pkgdir"/usr/share/themes/glacier/meegotouch/icons/icon-launcher-weather.png
}
 
