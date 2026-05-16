package: qd
description: QD double-double and quad-double floating-point library
version: "2.3.24"
tag: "2.3.24"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/qd-2.3.24.tar.gz
requires:
  - Python
  - automake
  - autoconf
  - libtool
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
patches:
  - qd-2.3.24.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  autoreconf --force --install
  ./configure --prefix=$INSTALLROOT --enable-shared
}
