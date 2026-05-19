package: go_demangle
description: go-demangle Go symbol demangling library
version: "5e5cf60"
tag: "5e5cf60"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/go_demangle-5e5cf60.tar.gz
requires:
  - CMake
  - go
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  cmake -E make_directory $INSTALLROOT/bin $INSTALLROOT/pkg $INSTALLROOT/src/github.com/ianlancetaylor/demangle
  cmake -E copy_directory $SOURCEDIR $INSTALLROOT/src/github.com/ianlancetaylor/demangle
  cmake -E chdir $INSTALLROOT/src/github.com/ianlancetaylor/demangle go install
}
