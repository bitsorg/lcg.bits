package: go.uuid
description: go.uuid Go UUID generation and parsing library
version: "b2ce238"
tag: "b2ce238"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/go.uuid-b2ce238.tar.gz
requires:
  - go
build_requires:
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include CMakeRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Make() {
  cmake -E make_directory $INSTALLROOT/bin $INSTALLROOT/pkg $INSTALLROOT/src/github.com/satori/go.uuid/
  cmake -E copy_directory $SOURCEDIR $INSTALLROOT/src/github.com/satori/go.uuid/
  cmake -E chdir $INSTALLROOT/src/github.com/satori/go.uuid/ go install
}
