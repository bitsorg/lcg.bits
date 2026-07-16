package: patchelf
description: PatchELF utility to patch ELF binary rpath/interpreter
version: "0.12"
source: https://github.com/NixOS/patchelf
tag: "%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
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
