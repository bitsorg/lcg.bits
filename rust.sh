package: rust
description: rust library/tool (from LCG software stack)
version: "1.94.1"
tag: "1.94.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/rust-1.94.1-${RUST_ARCH}-${RUST_OS}.tar.gz
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
  make ${JOBS:+-j $JOBS}
  $SOURCEDIR/install.sh --prefix=$INSTALLROOT  --verbose
}
