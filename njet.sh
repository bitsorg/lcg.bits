package: njet
description: NJet multi-parton one-loop matrix element library
version: "2.1.1"
source: https://bitbucket.org/njet/njet
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/%(name)s-%(version)s.tar.gz
requires:
  - qd
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
  # njet's NGluon uses std::allocator construct/destroy, removed in C++20, so it
  # can't compile at the stack default C++23. njet has no ROOT/key4hep dep, so pin
  # C++17: the trailing -std=c++17 overrides -std=c++23 from CXXFLAGS (last wins).
  ./configure --prefix="$INSTALLROOT" \
    --disable-autoflags \
    ${QD_ROOT:+--with-qd="$QD_ROOT"} \
    "FFLAGS=-ffixed-line-length-none -std=legacy" \
    "CXXFLAGS=${CXXFLAGS} -std=c++17" \
    FC=${FC:-gfortran} CC=$CC F77=${FC:-gfortran}
}
