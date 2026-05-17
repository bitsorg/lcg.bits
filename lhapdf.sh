package: lhapdf
description: LHAPDF parton density function interpolation library
version: "6.2.3"
tag: "6.2.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/LHAPDF-6.2.3.tar.gz
requires:
  - Python
  - cython
  - setuptools
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-only
patches:
  - lhapdf-6.2.3.patch
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
  ./configure --prefix=$INSTALLROOT
}
