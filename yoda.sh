package: yoda
description: YODA (Yet more Objects for Data Analysis) histogram library
version: "1.9.0"
tag: "1.9.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/YODA-1.9.0.tar.gz
requires:
  - Python
  - ROOT
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pysite"
##############################
function Configure() {
  ./configure --prefix=$INSTALLROOT CXXFLAGS=-Wno-register --with-boost=${Boost_ROOT}
}
