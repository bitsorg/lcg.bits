package: njet
description: NJet multi-parton one-loop matrix element library
version: "2.1.1"
tag: "2.1.1"
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
  # njet's NGluon code uses std::allocator<T>::construct/destroy, deprecated in
  # C++17 and REMOVED in C++20, so it cannot compile at the stack default C++23.
  # njet has no ROOT/key4hep dependency, so pin it to C++17. The trailing
  # -std=c++17 overrides the -std=c++23 inherited from the global CXXFLAGS
  # (last -std on the command line wins).
  ./configure --prefix="$INSTALLROOT" \
    --disable-autoflags \
    ${QD_ROOT:+--with-qd="$QD_ROOT"} \
    "FFLAGS=-ffixed-line-length-none -std=legacy" \
    "CXXFLAGS=${CXXFLAGS} -std=c++17" \
    FC=${FC:-gfortran} CC=$CC F77=${FC:-gfortran}
}
