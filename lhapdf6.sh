package: lhapdf6
description: lhapdf6 Monte Carlo event generator
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/LHAPDF-unknown.tar.gz
requires:
  - Boost
  - Python
  - cython
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
  ./configure --prefix=$INSTALLROOT --with-boost=${Boost_ROOT} --with-yaml-cpp=${yamlcpp_ROOT} PYTHON=${Python_ROOT}/bin/python3 CYTHON=${cython_ROOT}/bin/cython PYTHONPATH=${cython_pythonpath}  CFLAGS=-O2 CXXFLAGS=-O2 FCFLAGS=-O2 LDFLAGS=-O2
}
