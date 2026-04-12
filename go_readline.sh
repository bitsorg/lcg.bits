package: go_readline
description: go_readline library/tool (from LCG software stack)
version: "2972be2"
tag: "2972be2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/go_readline-2972be2.tar.gz
requires:
  - go
  - go_liner
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
  cmake -E make_directory $INSTALLROOT/bin $INSTALLROOT/pkg $INSTALLROOT/src/github.com/chzyer/readline/
  cmake -E copy_directory $SOURCEDIR $INSTALLROOT/src/github.com/chzyer/readline/
  cmake -E chdir $INSTALLROOT/src/github.com/chzyer/readline/ go install
}
