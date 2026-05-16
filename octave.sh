package: octave
description: GNU Octave high-level language for numerical computation
version: "10.3.0"
tag: "10.3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/octave-10.3.0.tar.gz
requires:
  - pcre
  - blas
  - Qt5
  - gnuplot
  - texinfo
  - readline
  - fftw
build_requires:
  - bits-recipe-tools
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib"
##############################
function Configure() {
  rsync -a --delete --exclude '**/.git' $SOURCEDIR/ .
  ./configure --prefix=$INSTALLROOT "CPPFLAGS=${OCTAVE_CPP_FLAGS}" "LDFLAGS=${OCTAVE_LD_FLAGS} ${BLASPATH}" "--with-blas=${BLASLIB}" "--with-lapack=${BLASLIB}" ${with_qt_flag} --libdir=$INSTALLROOT/lib --disable-rpath
}
