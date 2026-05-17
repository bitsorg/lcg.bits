package: bison
description: GNU Bison LALR/GLR parser generator
version: "3.8.2"
tag: "3.8.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/bison-3.8.2.tar.gz
requires:
  - m4
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
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  $SOURCEDIR/configure --prefix= --enable-relocatable CC=$CC
}
