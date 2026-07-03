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
  # macOS: bits gmp's include/ isn't on configure's search path (AC_CHECK_HEADER
  # only checks default paths + CPPFLAGS), so point --with-gmp at the bits gmp.
  _with_gmp=""
  bits_is_macos && _with_gmp="--with-gmp=${GMP_ROOT}"
  ./configure --prefix="$INSTALLROOT" ${_with_gmp}
}
