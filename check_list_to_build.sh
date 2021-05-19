#!/bin/bash

declare -a PACKAGES_BUILD
declare -a PACKAGES_FILES
declare -a PACKAGES_TO_ADD
declare -a PACKAGES_TO_REMOVE

BUILDARCH=aarch64
function check_add() {
    PACKAGES_BUILD+=("$1")
}
export BUILD_USER="$(whoami)"
export BUILD="check_add"
export -f check_add

source ./deploy.sh

for pkgfile in $(find . -name 'PKGBUILD'); do
    pkg=$(dirname "$pkgfile")
    pkg=${pkg:2}
    PACKAGES_FILES+=("$pkg")
done

for pkg in ${PACKAGES_FILES[@]}; do
    found=0
    for build in ${PACKAGES_BUILD[@]}; do
        if [ "$pkg" = "$build" ]; then
            found=1
            break;
        fi
    done
    if [ "$found" -eq 0 ]; then
        PACKAGES_TO_ADD+=("$pkg")
    fi
done

for build in ${PACKAGES_BUILD[@]}; do
    found=0
    for pkg in ${PACKAGES_FILES[@]}; do
        if [ "$pkg" = "$build" ]; then
            found=1
            break;
        fi
    done
    if [ "$found" -eq 0 ]; then
        PACKAGES_TO_REMOVE+=("$build")
    fi
done


function print_arr() {
    for pkg in ${1}; do
        echo $pkg
    done
}

#print_arr "${PACKAGES_BUILD[*]}"
#print_arr "${PACKAGES_FILES[*]}"
echo "========== ADDED =========="
print_arr "${PACKAGES_TO_ADD[*]}"
echo "========== REMOVED =========="
print_arr "${PACKAGES_TO_REMOVE[*]}"

