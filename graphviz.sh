package: graphviz
description: graphviz library/tool (from LCG software stack)
version: "12.2.1"
tag: "12.2.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/graphviz-12.2.1.tar.gz
requires:
  - libtool
  - expat
  - fontconfig
  - png
  - gettext
  # optional:
  # - pango
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
  ./configure --prefix $INSTALLROOT
}
