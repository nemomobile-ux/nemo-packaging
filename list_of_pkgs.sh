#!/bin/bash
#
# prints list of packages as declare -p PACKAGES_BUILD which can be loaded using eval
#

if [ -f "list_of_pkgs.cache" ]; then
    source "list_of_pkgs.cache"
    declare -p PACKAGES_BUILD
    exit 0
fi

declare -a PACKAGES_BUILD

function check_add() {
    PACKAGES_BUILD+=("$1")
}
BUILDARCH=aarch64
export BUILD_USER="$(whoami)"
export BUILD="check_add"
export -f check_add

source ./deploy.sh &> /dev/null
BUILDARCH=x86_64
source ./deploy.sh &> /dev/null

declare -p PACKAGES_BUILD
declare -p PACKAGES_BUILD > list_of_pkgs.cache
