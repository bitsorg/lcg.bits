package: go_liner
description: go_liner library/tool (from LCG software stack)
version: "6f820f8"
tag: "6f820f8"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/go_liner-6f820f8.tar.gz
requires:
  - go
  - go_runewidth
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
  cmake -E make_directory $INSTALLROOT/bin $INSTALLROOT/pkg $INSTALLROOT/src/github.com/peterh/liner
  cmake -E copy_directory $SOURCEDIR $INSTALLROOT/src/github.com/peterh/liner
  cmake -E chdir $INSTALLROOT/src/github.com/peterh/liner go install
}
