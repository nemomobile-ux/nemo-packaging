#!/bin/bash

cd "$(dirname "$(realpath "${BASH_SOURCE[0]}")")" #"

export results_dir="/var/www/html/build-results"
export log_dir="$results_dir/../logs" #"
test -f "$log_dir/last_id" && export build_id=$(<"$log_dir/last_id")
export BUILD_CHROOT=/mnt/data/chrootbuild
#export BUILD_CHROOT=/var/lib/manjaro-arm-tools/pkg/aarch64
export CUSTOM_REPO_NAME=nemomobile
export CUSTOM_REPO_URL="http://localhost/build-results/nemomobile.db"
export BRANCH="${BRANCH-arm-stable}"

export USE_GIT_PACKAGES="${USE_GIT_PACKAGES-1}"


SED_EXPR=""
if [ "$USE_GIT_PACKAGES" = 1 ]; then

    eval $(./list_of_pkgs.sh) # list of packages are loaded into PACKAGES_BUILD see # declare -p PACKAGES_BUILD

    for pkg in ${PACKAGES_BUILD[@]}; do
        pkg=$(basename "$pkg")
        non_git=${pkg%-git}
        if [ "$pkg" = "$non_git" ]; then
            continue
        fi
        SED_EXPR+="s/'$non_git'/'$pkg'/g;"
    done
fi
export SED_EXPR

#
# $1 name of repo to build e.g. 'tut-git'
#
function build_directory() {
    echo "building $1 ..."

    log_name=$(printf "%s/%03d-%s.log" "$log_dir" "$build_id" "${1//\//.}")
    mkdir -p $(dirname "$log_name");

    (
        if [ -n "$SED_EXPR" ]; then
            sed -i "$SED_EXPR" "$1/PKGBUILD"
        fi

        local WORKDIR=$(pwd)

        local arg="./$1"
        local pkg_name=${arg##*/}
        local pkg_dir="${arg%/*}"

        cd "$pkg_dir"

        unset ADD_REPO
        if [ -n "$(find "$results_dir" -mindepth 1 -maxdepth 1)" ]; then
            ADD_REPO="$CUSTOM_REPO_URL"
        fi

        chrootbuild -c -D -f ${ADD_REPO:+-k "$ADD_REPO"} ${BUILD_CHROOT:+-r "$BUILD_CHROOT"} -n ${BRANCH:+-b "${BRANCH}"} -p $pkg_name #"
        ret=$?
        cd $WORKDIR

        find . -mindepth 1 -type f  -name '*.pkg.tar.zst' -exec rsync -avz --remove-source-files {} "$results_dir" \;
        rm -rvf "${results_dir?invalid dir}/${CUSTOM_REPO_NAME}".db*
        rm -rvf "${results_dir?invalid dir}/${CUSTOM_REPO_NAME}".files*
        repo-add -q "$results_dir/$CUSTOM_REPO_NAME.db.tar.xz" "$results_dir"/*.pkg.tar.*

        return $ret
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

./deploy.sh

chmod uga+rwX "$results_dir" -R
chmod uga+rwX "$log_dir" -R
