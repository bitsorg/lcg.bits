package: professor
description: Professor Monte Carlo generator tuning tool
version: "2.5.6"
tag: "2.5.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - cython
  - matplotlib
  - numpy
  - yoda
  - sympy
  - eigen
  - wheel
  - iminuit
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
MODULE_OPTIONS="--bin --lib"
##############################
# professor's Makefile forms `-std=$(CXXSTD)`, but bits exports CXXSTD as a bare
# number (e.g. 23), giving invalid `-std=23`. Hand it the `c++NN` token instead
# (matches the c++23 of dependency ROOT).
export CXXSTD="c++${CXXSTD:-17}"
##############################
function Configure() {
  ./configure --prefix=$INSTALLROOT --with-eigen=${EIGEN_ROOT} URL ${gen_url}/professor-2.5.6.tar.gz
}
