package: lhapdf6
description: LHAPDF 6 parton density function interpolation library
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
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-only
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  ./configure --prefix=$INSTALLROOT --with-boost=${Boost_ROOT} --with-yaml-cpp=${yamlcpp_ROOT} PYTHON=${Python_ROOT}/bin/python3 CYTHON=${cython_ROOT}/bin/cython PYTHONPATH=${cython_pythonpath}  CFLAGS=-O2 CXXFLAGS=-O2 FCFLAGS=-O2 LDFLAGS=-O2
}
