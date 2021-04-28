#!/bin/bash

git submodule sync --recursive
git submodule update --recursive --remote --init
