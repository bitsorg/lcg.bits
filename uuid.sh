package: uuid
description: libuuid universally unique identifier library
version: "1.42"
tag: "1.42"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/e2fsprogs-1.42.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ./configure --prefix $INSTALLROOT ${uuid_config_options}
}
