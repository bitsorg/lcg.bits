package: libffi
description: libffi library/tool (from LCG software stack)
version: "3.4.2"
tag: "3.4.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libffi-3.4.2.tar.gz
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  $SOURCEDIR/configure --prefix=$INSTALLROOT ${_libffi_opt}
}
