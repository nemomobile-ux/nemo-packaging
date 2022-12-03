#!/bin/bash

declare -a PACKAGES_BUILD
declare -a PACKAGES_FILES
declare -a PACKAGES_TO_ADD
declare -a PACKAGES_TO_REMOVE

eval $(./list_of_pkgs.sh) # list of packages are loaded into PACKAGES_BUILD see # declare -p PACKAGES_BUILD

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


remove_count=${#PACKAGES_TO_REMOVE[*]}
add_count=${#PACKAGES_TO_ADD[*]}

echo "Summary: remove_count = $remove_count; add_count = $add_count"
if [ "$((add_count + remove_count))" -gt 0 ]; then
    exit 1
fi