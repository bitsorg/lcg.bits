package: fplll
description: fplll lattice reduction algorithms library
version: "5.4.4"
source: https://github.com/fplll/fplll
tag: "%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - gmp
  - mpfr
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-2.1-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
    # The release tarball already ships a working ./configure; ./autogen.sh is
    # not always present (it is absent on macOS, where it errored "No such file
    # or directory"), so run it only if present and don't fail if it isn't.
    [ -x ./autogen.sh ] && ./autogen.sh || true
    # macOS: configure probes GMP on default paths and fails because the bits
    # gmp dep isn't there; point it at GMP_ROOT explicitly.
    local _gmp=""
    bits_is_macos && _gmp="--with-gmp=${GMP_ROOT}"
    CXXFLAGS="-fPIC -g -O2 -std=c++17" \
    ./configure --prefix=$INSTALLROOT --with-mpfr=${MPFR_ROOT} ${_gmp}
}
