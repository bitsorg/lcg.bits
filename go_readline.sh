package: go_readline
description: readline Go bindings for the GNU readline library
version: "2972be2"
tag: "2972be2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/go_readline-2972be2.tar.gz
requires:
  - CMake
  - go
  - go_liner
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
  cmake -E make_directory $INSTALLROOT/bin $INSTALLROOT/pkg $INSTALLROOT/src/github.com/chzyer/readline/
  cmake -E copy_directory $SOURCEDIR $INSTALLROOT/src/github.com/chzyer/readline/
  cmake -E chdir $INSTALLROOT/src/github.com/chzyer/readline/ go install
}
