package: patchelf
description: PatchELF utility to patch ELF binary rpath/interpreter
version: "0.12"
tag: "0.12"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/patchelf-0.12.tar.gz
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
  ./bootstrap.sh
  ./configure --prefix=$INSTALLROOT
}
