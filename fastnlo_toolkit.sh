package: fastnlo_toolkit
description: fastNLO toolkit for perturbative QCD calculations with NLO tables
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/fastnlo_toolkit-unknown.tar.gz
requires:
  - lhapdf
  - yoda
  - fastjet
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ./configure --prefix=$INSTALLROOT --with-lhapdf=${lhapdf_ROOT} --with-fastjet=${fastjet_ROOT} --with-yoda=${yoda_ROOT} "CFLAGS=-g0 ${C_FLAGS}" "CXXFLAGS=-g0 ${CXX_FLAGS}" "FCFLAGS=-g0 ${Fortran_FLAGS}" #    --enable-pyext   # need to specify swig package if this option is switched on!
}
