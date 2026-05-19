package: go_runewidth
description: runewidth Go library for calculating rune widths
version: "703b5e6"
tag: "703b5e6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/go_runewidth-703b5e6.tar.gz
requires:
  - CMake
  - go
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  cmake -E make_directory $INSTALLROOT/bin $INSTALLROOT/pkg $INSTALLROOT/src/github.com/mattn/go-runewidth
  cmake -E copy_directory $SOURCEDIR $INSTALLROOT/src/github.com/mattn/go-runewidth
  cmake -E chdir $INSTALLROOT/src/github.com/mattn/go-runewidth go install
}
