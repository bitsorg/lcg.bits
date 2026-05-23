package: giflib
description: GIF image format library
version: "5.2.2"
tag: "5.2.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--lib"
##############################
function Make() {
  rsync -av --delete --exclude '**/.git' --delete-excluded "${SOURCEDIR}"/ ./
  # Only forward CC if it is non-empty; giflib's Makefile defaults to 'cc'.
  make ${CC:+CC="$CC"} ${JOBS:+-j $JOBS} \
    $(uname | grep -q Darwin && echo libgif.dylib || echo libgif.so) libgif.a
}
function MakeInstall() {
  make install-bin install-include install-lib PREFIX="$INSTALLROOT"
}
