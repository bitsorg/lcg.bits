package: go_demangle
description: go_demangle library/tool (from LCG software stack)
version: "5e5cf60"
tag: "5e5cf60"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/go_demangle-5e5cf60.tar.gz
requires:
  - go
build_requires:
  - bits-recipe-tools
license: TODO
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
