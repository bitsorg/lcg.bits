package: gophernotes
description: Gophernotes Go kernel for Jupyter notebooks
version: "7c3ca4e"
tag: "7c3ca4e"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - CMake
  - go
  - pkg_config
  - go_zmq4
  - go.uuid
  - go_liner
  - go_runewidth
  - gomacro
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
function Configure() { :; }
function Make() {
  cmake -E make_directory $INSTALLROOT/bin $INSTALLROOT/pkg $INSTALLROOT/src/github.com/gopherdata/gophernotes
  cmake -E copy_directory $SOURCEDIR $INSTALLROOT/src/github.com/gopherdata/gophernotes
  cmake -E chdir $INSTALLROOT/src/github.com/gopherdata/gophernotes go install
}
