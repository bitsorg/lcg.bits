package: gomacro
description: Gomacro Go interpreter with generics/macro support
version: "c9f381e"
tag: "c9f381e"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/gomacro-c9f381e.tar.gz
requires:
  - go
  - go_liner
  - go_runewidth
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MPL-2.0
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  cmake -E make_directory $INSTALLROOT/bin $INSTALLROOT/pkg $INSTALLROOT/src/github.com/cosmos72/gomacro/
  cmake -E copy_directory $SOURCEDIR $INSTALLROOT/src/github.com/cosmos72/gomacro/
  cmake -E chdir $INSTALLROOT/src/github.com/cosmos72/gomacro/ go install
}
