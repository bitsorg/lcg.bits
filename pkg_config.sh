package: pkg_config
description: pkg_config library/tool (from LCG software stack)
version: "0.29.2"
tag: "0.29.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pkg-config-0.29.2.tar.gz
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - pkg_config-0.29.2.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ./configure  --with-internal-glib --prefix=$INSTALLROOT --with-system-include-path=/usr/include
}
