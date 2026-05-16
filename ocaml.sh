package: ocaml
description: OCaml functional programming language compiler and standard library
version: "4.14.2"
tag: "4.14.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ocaml-4.14.2.tar.gz
build_requires:
  - bits-recipe-tools
license: LGPL-2.1-or-later WITH OCaml-LGPL-linking-exception
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  # Version >= 4.10.0: --disable-force-safe-string is supported
  $SOURCEDIR/configure --prefix $INSTALLROOT --disable-force-safe-string
}
function Make() {
  make ${JOBS:+-j $JOBS}
  make world.opt
}