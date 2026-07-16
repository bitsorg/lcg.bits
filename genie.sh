package: GENIE
description: Comprehensive Monte Carlo neutrino event generator
version: "2.12.6"
source: https://github.com/GENIE-MC/Generator
tag: "R-2-12-6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/%(name)s-%(version)s.tar.bz2
requires:
  - ROOT
  - lhapdf
  - pythia6
  - log4cpp
  - GSL
  - libxml2
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-only
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
# GENIE's generated Makefiles reference $GENIE (source root) and need ROOT in
# ROOTSYS/PATH, for build and install too. Export at recipe scope; bits runs
# every phase in the same build directory ($PWD).
export GENIE="$PWD"
export ROOTSYS="${ROOT_ROOT}"
export PATH="${ROOT_ROOT}/bin:$PATH"
##############################
function Configure() {
  ./configure --prefix="$INSTALLROOT" --enable-lhapdf --enable-validation-tools \
    --enable-test --enable-numi --enable-atmo --enable-nucleon-decay --enable-rwght \
    --enable-pythia6 --enable-mathmore \
    --with-pythia6-lib=${PYTHIA6_ROOT}/lib \
    --with-lhapdf-lib=${LHAPDF_ROOT}/lib --with-lhapdf-inc=${LHAPDF_ROOT}/include \
    --with-log4cpp-inc=${LOG4CPP_ROOT}/include --with-log4cpp-lib=${LOG4CPP_ROOT}/lib \
    --with-libxml2-lib=${LIBXML2_ROOT}/lib --with-libxml2-inc=${LIBXML2_ROOT}/include/libxml2
}
