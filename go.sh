package: go
description: go library/tool (from LCG software stack)
version: "1.12.5"
tag: "1.12.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/go1.12.5.tar.gz
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
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  cmake -E chdir $SOURCEDIR/src bash ./make.bash
  cmake -E copy_directory $SOURCEDIR $INSTALLROOT
}
