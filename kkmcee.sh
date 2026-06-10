package: kkmcee
description: KKMC-ee Monte Carlo generator for e+e- annihilation
version: "5.01.00"
tag: "5.01.00"
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
  # configure.ac uses obsolete AC_PROG_LIBTOOL; autoreconf can't find libtool's m4
  # macros or aux files. Put bits libtool/automake aclocal dirs on ACLOCAL_PATH
  # and run libtoolize so the macros are found and aux files installed.
  export ACLOCAL_PATH="${LIBTOOL_ROOT}/share/aclocal:${AUTOMAKE_ROOT}/share/aclocal:${ACLOCAL_PATH}"
  libtoolize --install --copy --force
  autoreconf --force --install
  # photoscpp's Log.h builds std::string from nullptr, a deleted overload in C++23.
  # Build at C++20: the trailing -std=c++20 overrides the stack-default c++23 in
  # CXXFLAGS (last -std wins).
  ./configure --with-photos=${PHOTOSCPP_ROOT} --prefix=$INSTALLROOT \
    CXXFLAGS="${CXXFLAGS} -std=c++20"
}
