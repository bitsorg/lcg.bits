package: go_zmq4
description: go_zmq4 library/tool (from LCG software stack)
version: "7a493a6"
tag: "7a493a6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/go_zmq4-7a493a6.tar.gz
requires:
  - go
  - zeromq
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
  cmake -E make_directory $INSTALLROOT/bin $INSTALLROOT/pkg $INSTALLROOT/src/github.com/pebbe/zmq4/
  cmake -E copy_directory $SOURCEDIR $INSTALLROOT/src/github.com/pebbe/zmq4/
  cmake -E chdir $INSTALLROOT/src/github.com/pebbe/zmq4/ go install
}
