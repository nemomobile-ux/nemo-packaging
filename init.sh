#!/bin/bash

pacman -S nginx rsync manajro-arm-tools manjaro-tools-base fakeroot base-devel

git submodule sync --recursive
git submodule update --recursive --remote --init
