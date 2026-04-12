package: fontconfig
description: Library for font configuration and customization
version: "2.14.2"
tag: "2.14.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/fontconfig-2.14.2.tar.gz
requires:
  - freetype
  - gperf
  - expat
  - pkg_config
  - uuid
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
  ./configure --disable-docs --prefix=$INSTALLROOT
}
