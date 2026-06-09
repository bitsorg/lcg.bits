package: fplll
description: fplll lattice reduction algorithms library
version: "5.4.4"
tag: "5.4.4"
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
    # macOS: fplll's configure probes for GMP on the default search paths and
    # fails ("GMP version >= 4.2.0 needed") because the bits gmp dependency is
    # not there. Point it at GMP_ROOT explicitly. On Linux the bits dep env puts
    # GMP on the default paths, so the line stays unchanged.
    local _gmp=""
    bits_is_macos && _gmp="--with-gmp=${GMP_ROOT}"
    CXXFLAGS="-fPIC -g -O2 -std=c++17" \
    ./configure --prefix=$INSTALLROOT --with-mpfr=${MPFR_ROOT} ${_gmp}
}
