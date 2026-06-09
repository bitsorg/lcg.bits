package: mpfr
description: GNU MPFR multiple-precision floating-point library
version: "4.2.1"
tag: "4.2.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - gmp
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib --inc --pkgconfig"
##############################
function Configure() {
  # macOS: the bits dependency environment does not put the (bits-built) gmp's
  # include/ on the compiler search path for mpfr's plain-autotools configure --
  # its AC_CHECK_HEADER(gmp.h) only consults the default paths + CPPFLAGS -- so
  # configure fails with "gmp.h can't be found". Point it at the bits gmp
  # explicitly. No-op on Linux, where gmp.h is already found.
  _with_gmp=""
  bits_is_macos && _with_gmp="--with-gmp=${GMP_ROOT}"
  ./configure --prefix="$INSTALLROOT" ${_with_gmp}
}
