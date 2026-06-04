package: fplll
description: fplll lattice reduction algorithms library
version: "5.4.4"
tag: "5.4.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - gmp
  - mpfr
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() { 
    ./autogen.sh
    CXXFLAGS="-fPIC -g -O2 -std=c++17" \
    ./configure --prefix=$INSTALLROOT --with-mpfr=${MPFR_ROOT}
}
