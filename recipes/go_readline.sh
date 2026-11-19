package: go_readline
description: readline Go bindings for the GNU readline library
version: "2972be2"
source: https://github.com/chzyer/readline
tag: "%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
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
function Configure() { :; }
function Make() {
  cmake -E make_directory $INSTALLROOT/bin $INSTALLROOT/pkg $INSTALLROOT/src/github.com/chzyer/readline/
  cmake -E copy_directory $SOURCEDIR $INSTALLROOT/src/github.com/chzyer/readline/
  cmake -E chdir $INSTALLROOT/src/github.com/chzyer/readline/ go install
}
function MakeInstall() { :; }
