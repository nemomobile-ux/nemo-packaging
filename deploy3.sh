#!/bin/bash

export results_dir="/var/www/html/build-results"
export log_dir="$results_dir/../logs" #"
export build_id=$(cat "$log_dir/last_id")
export reponame="nemomobile"
export CUSTOM_REPO_NAME=nemomobile
export CUSTOM_REPO_URL="http://localhost/build-results"
export BUILD_CHROOT=/var/lib/manjaro-arm-tools/pkg/aarch64

#
# $1 name of repo to build e.g. 'tut-git'
#
function build_directory() {
    echo "building $1 ..."


    log_name=$(printf "%s/%03d-%s.log" "$log_dir" "$build_id" "${1//\//.}")
    mkdir -p $(dirname "$log_name");

    (

        if test -f "$BUILD_CHROOT/etc/pacman.conf" && ! grep -q "^\[$CUSTOM_REPO_NAME\]" "$BUILD_CHROOT/etc/pacman.conf"; then
            sed -i "s/^\[core\]/\[$CUSTOM_REPO_NAME\]\nSigLevel = Optional TrustAll\nServer = ${CUSTOM_REPO_URL//\//\\/}\n\n\[core\]/" "$BUILD_CHROOT/etc/pacman.conf"
        fi

        rsync -r -v /var/cache/manjaro-arm-tools/pkg/aarch64/. "$results_dir"
        rm -rvf "${results_dir}/${CUSTOM_REPO_NAME}".db*
        rm -rvf "${results_dir}/${CUSTOM_REPO_NAME}".files*
        repo-add -q "$results_dir/$CUSTOM_REPO_NAME.db.tar.xz" "$results_dir"/*.pkg.tar.*
        manjaro-chroot "$BUILD_CHROOT/" pacman -Syyu --noconfirm

        buildarmpkg -k -p $*
    ) 2>&1 | tee "$log_name"
    ret="${PIPESTATUS[0]}"

    if [ "$ret" -eq 0 ]; then
        status="OK"
    else
        status="FAIL"
    fi

    echo $status
    mv "$log_name" "${log_name%.log}.${status}.log"


    build_id=$(( build_id + 1 ))

    echo "$build_id" > "$log_dir/last_id"
}
export BUILDARCH="aarch64"
export BUILD="build_directory"
export -f build_directory

mkdir -p "$results_dir"
mkdir -p "$log_dir"

rm -rfv /var/cache/manjaro-arm-tools/pkg/aarch64
rm -rfv /var/cache/manjaro-arm-tools/pkg/pkg-cache/*

buildarmpkg -p none-just-init-the-chroot

./deploy.sh

        rsync -r -v /var/cache/manjaro-arm-tools/pkg/aarch64/. "$results_dir"
        rm -rvf "${results_dir}/${CUSTOM_REPO_NAME}".db*
        rm -rvf "${results_dir}/${CUSTOM_REPO_NAME}".files*
        repo-add -q "$results_dir/$CUSTOM_REPO_NAME.db.tar.xz" "$results_dir"/*.pkg.tar.*
        manjaro-chroot "$BUILD_CHROOT/" pacman -Syyu --noconfirm
