package: mpfr
description: GNU MPFR multiple-precision floating-point library
version: "4.2.1"
source: https://gitlab.inria.fr/mpfr/mpfr
tag: "v%(version)s"
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
  # gmp is a bits dependency, but AC_CHECK_HEADER only searches default paths +
  # CPPFLAGS and bits gmp's include/ is on neither (it was only found before via a
  # system gmp on the build host; a clean container has none). Point --with-gmp at
  # the bits gmp on every platform.
  ./configure --prefix="$INSTALLROOT" --with-gmp="${GMP_ROOT}"
}
