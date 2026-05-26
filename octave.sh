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
  - readline
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
  # Collect include/library paths for all non-system deps.
  local _cppflags="${BLAS_ROOT:+-I${BLAS_ROOT}/include}\
${READLINE_ROOT:+ -I${READLINE_ROOT}/include}\
${FFTW_ROOT:+ -I${FFTW_ROOT}/include}\
${PCRE2_ROOT:+ -I${PCRE2_ROOT}/include}\
${QT5_ROOT:+ -I${QT5_ROOT}/include}"
  local _ldflags="${BLAS_ROOT:+-L${BLAS_ROOT}/lib}\
${READLINE_ROOT:+ -L${READLINE_ROOT}/lib}\
${FFTW_ROOT:+ -L${FFTW_ROOT}/lib}\
${PCRE2_ROOT:+ -L${PCRE2_ROOT}/lib}"
  # readline links against ncurses for terminal symbols (UP, etc.)
  _ldflags="${_ldflags}${NCURSES_ROOT:+ -L${NCURSES_ROOT}/lib} -lncurses"

  ./configure --prefix="${INSTALLROOT}" \
    "CPPFLAGS=${_cppflags}" \
    "LDFLAGS=${_ldflags}" \
    ${BLAS_ROOT:+--with-blas=openblas --with-lapack=openblas} \
    --with-qt=5 \
    --libdir="${INSTALLROOT}/lib" \
    --disable-rpath
}
