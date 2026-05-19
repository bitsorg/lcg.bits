package: graphviz
description: Graphviz graph visualization software
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
prefer_system: ".*"
prefer_system_check:

build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: EPL-1.0
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure --prefix $INSTALLROOT
}
