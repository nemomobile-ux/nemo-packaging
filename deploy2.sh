#!/bin/bash

export build_id=0
export results_dir="$(dirname "$(realpath "$0")")/../build-results/packages"  #"
export log_dir="$results_dir/../logs" #"
mkdir -p "$results_dir"
mkdir -p "$log_dir"

function build_directory() {
    echo "building $1 ..."

    log_name=$(printf "%s/%02d-%s.log" "$log_dir" "$build_id" "$1")
    mkdir -p "$(dirname "$log_name")"

    cd "$1"

    su builder -c 'makepkg -f --syncdeps --noconfirm'  &> "$log_name"
    ret="$?"
    if [ "$ret" -eq 0 ]; then
        status="OK"
        for pkg in $(find . -name '*zst'); do
            pacman --noconfirm -U "$pkg"
            chmod uga=rwX "$pkg"
            cp "$pkg" "$results_dir"
        done
    else
        status="FAIL"
    fi
    echo $status
    mv "$log_name" "${log_name%.log}.${status}.log"

    cd "$OLDPWD"

    build_id=$(( build_id + 1 ))

}
export BUILD_USER="$(whoami)"
export BUILD="build_directory"
export -f build_directory
./deploy.sh

cd "$results_dir"
repo-add nemomobile.db.tar.gz *.pkg.tar.zst
