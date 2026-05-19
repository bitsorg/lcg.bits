package: libxslt
description: libxslt XSLT C library for GNOME
version: "1.1.38"
tag: "1.1.38"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/libxslt-1.1.38.tar.gz
requires:
  - libxml2
prefer_system: ".*"
prefer_system_check:

build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure --prefix=$INSTALLROOT --without-python
}
