package: fastnlo_toolkit
description: fastNLO toolkit for perturbative QCD calculations with NLO tables
version: "2.3.1pre-1871"
tag: "2.3.1pre-1871"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/%(name)s-%(version)s.tar.gz
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
  ./configure --prefix=$INSTALLROOT --with-lhapdf=${LHAPDF_ROOT} --with-fastjet=${FASTJET_ROOT} --with-yoda=${YODA_ROOT} "CFLAGS=-g0 ${C_FLAGS}" "CXXFLAGS=-g0 ${CXX_FLAGS}" "FCFLAGS=-g0 ${Fortran_FLAGS}" #    --enable-pyext   # need to specify swig package if this option is switched on!
}
