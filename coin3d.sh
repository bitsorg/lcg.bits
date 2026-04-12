package: coin3d
description: Coin3D Open Inventor 3D graphics scene graph library
version: "3.1.3p2"
tag: "3.1.3p2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Coin-3.1.3p2.tar.gz
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - coin3d-3.1.3p2.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ./configure --prefix=$INSTALLROOT --enable-debug=no --enable-symbols=no ${coin3d_config_opts} ${libtoolpatch}
}
