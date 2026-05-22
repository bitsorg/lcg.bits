package: FORM
description: FORM symbolic manipulation system for Feynman diagram calculations
version: "4.3.1"
tag: "4.3.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/FORM-v4.3.1.tar.gz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Configure() {
  ./configure --prefix="$INSTALLROOT" CC=$CC CXX=$CXX
}
