package: octave
description: GNU Octave high-level language for numerical computation
version: "10.3.0"
tag: "10.3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - pcre2
  - blas
  - Qt5
  - gnuplot
  - texinfo
# - readline
  - fftw
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
  export LDFLAGS="-L${BLAS_ROOT}/lib"
  export LIBS="-lopenblas"
 ./configure --prefix="${INSTALLROOT}" --with-blas=openblas --with-lapack=openblas --disable-readline --with-qt=5 --disable-rpath
}
