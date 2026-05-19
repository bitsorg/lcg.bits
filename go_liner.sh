package: go_liner
description: liner Go readline-like library for command-line input
version: "6f820f8"
tag: "6f820f8"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/go_liner-6f820f8.tar.gz
requires:
  - CMake
  - go
  - go_runewidth
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
  cmake -E make_directory $INSTALLROOT/bin $INSTALLROOT/pkg $INSTALLROOT/src/github.com/peterh/liner
  cmake -E copy_directory $SOURCEDIR $INSTALLROOT/src/github.com/peterh/liner
  cmake -E chdir $INSTALLROOT/src/github.com/peterh/liner go install
}
