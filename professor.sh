package: professor
description: Professor Monte Carlo generator tuning tool
version: "2.5.6"
tag: "2.5.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/professor-2.5.6.tar.gz
requires:
  - Python
  - cython
  - matplotlib
  - numpy
  - yoda
  - sympy
  - eigen
  - pip
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
function Configure() {
  ./configure --prefix=$INSTALLROOT --with-eigen=${EIGEN_ROOT} URL ${gen_url}/professor-2.5.6.tar.gz
}
