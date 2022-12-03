#!/bin/bash
#
# prints list of packages as declare -p PACKAGES_BUILD which can be loaded using eval
#

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
