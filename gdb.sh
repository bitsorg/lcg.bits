package: gdb
description: GNU Debugger for C, C++, Fortran, and other languages
version: "17.2"
source: https://sourceware.org/git/binutils-gdb.git
tag: "gdb-%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - texinfo
  - Python
  - gmp
  - mpfr
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Configure() {
  # gdb 17.2 requires GMP 4.2+ and MPFR 3.1.0+; point configure at the
  # bits-built deps (their prefixes are not on the default search path).
  $SOURCEDIR/configure --prefix=$INSTALLROOT --enable-install-libiberty \
    --with-gmp="${GMP_ROOT}" --with-mpfr="${MPFR_ROOT}"
}
