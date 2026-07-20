package: kkmcee
description: KKMC-ee Monte Carlo generator for e+e- annihilation
version: "5.01.00"
source: https://github.com/KrakowHEPSoft/KKMCee
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/%(name)s-%(version)s.tar.gz
requires:
  - ROOT
  - photoscpp
  - hepmc3
  - autoconf
  - automake
  - libtool
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-KKMC-ee
# CPC Program Library non-profit licence — no redistribution grant (2026-07-20 license ruling): build and private-store reuse are
# fine, but this package must never be laid into a public CVMFS tree.
redistributable: false
patches:
  - kkmcee-5.01.00.patch
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  cmake -E create_symlink dizet-6.45 dizet
  # configure.ac uses the obsolete AC_PROG_LIBTOOL, so autoreconf can't find
  # libtool's m4 macros (and then config.guess/sub). Put the bits libtool/automake
  # aclocal dirs on ACLOCAL_PATH and run libtoolize so macros + aux files resolve.
  export ACLOCAL_PATH="${LIBTOOL_ROOT}/share/aclocal:${AUTOMAKE_ROOT}/share/aclocal:${ACLOCAL_PATH}"
  libtoolize --install --copy --force
  autoreconf --force --install
  # photoscpp's Log.h constructs std::string from nullptr, a deleted overload in
  # C++23. Build kkmcee at C++20: the trailing -std=c++20 overrides the stack
  # default -std=c++23 from CXXFLAGS (last -std wins).
  ./configure --with-photos=${PHOTOSCPP_ROOT} --prefix=$INSTALLROOT \
    CXXFLAGS="${CXXFLAGS} -std=c++20"
}
