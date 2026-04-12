package: ocaml
description: ocaml library/tool (from LCG software stack)
version: "4.14.2"
tag: "4.14.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ocaml-4.14.2.tar.gz
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  $SOURCEDIR/configure --prefix $INSTALLROOT --disable-force-safe-string ELSE CONFIGURE_COMMAND $SOURCEDIR/configure --prefix $INSTALLROOT
}