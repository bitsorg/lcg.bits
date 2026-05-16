package: pkg_config
description: pkg-config helper tool for querying library compile/link flags
version: "0.29.2"
tag: "0.29.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pkg-config-0.29.2.tar.gz
build_requires:
  - bits-recipe-tools
license: GPL-2.0-or-later
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
