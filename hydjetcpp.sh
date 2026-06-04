package: hydjetcpp
description: HYDJET++ improved heavy-ion Monte Carlo generator with jet quenching
version: "2.1"
tag: "2.1"
requires:
  - ROOT
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-HYDJET++
---
#!/bin/bash -e
##############################
. $(bits-include MakeRecipe)
##############################
MODULE_OPTIONS="--bin"
##############################
function Prepare() {
  # The HYDJET++ ZIP has all files directly at the archive root (no wrapping
  # directory).  bits would extract with strip=1 and skip root-level files.
  # Download and unzip manually into the build directory.
  curl -fSL \
    "https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/HYDJET++2_1.ZIP" \
    -o HYDJET++2_1.ZIP
  unzip -q HYDJET++2_1.ZIP
  rm -f HYDJET++2_1.ZIP
}
function Make() {
  # HYDJET++ uses a plain Makefile with no configure step.
  # root-config must be on PATH; F77LIBSO points to the gfortran shared library
  # (the Makefile auto-detects gfortran but not its library path under GCC-Toolchain).
  #
  # The bundled PYQUEN Fortran (e.g. progs_fortran.f) is nonconforming legacy
  # code: it calls SPLINE(N,X,Y,B,C,D) — whose dummies are DIMENSION X(100) … —
  # with shorter actual arrays.  gfortran >= 10 rejects this with
  # "Actual argument contains too few elements".  -fallow-argument-mismatch
  # downgrades it back to a warning (the same remedy lcgcmake applies to crmc for
  # gcc > 9); -std=legacy covers other old constructs.  The Makefile's default
  # F77FLAGS is "-fPIC", which we preserve.
  # gfortran's shared runtime is libgfortran.dylib on macOS, .so on Linux.
  _libgf=libgfortran.so; [ "$(uname)" = Darwin ] && _libgf=libgfortran.dylib
  PATH="${ROOT_ROOT:+$ROOT_ROOT/bin:}$PATH" \
    make ${JOBS:+-j $JOBS} \
    F77LIBSO="$(${FC:-gfortran} -print-file-name=${_libgf})" \
    F77FLAGS="-fPIC -std=legacy -fallow-argument-mismatch"
}
function MakeInstall() {
  mkdir -p "$INSTALLROOT/bin" "$INSTALLROOT/share/hydjetcpp"
  cp HYDJET "$INSTALLROOT/bin/"
  # RunInputHydjet is the run-parameter input file; particles.data is the
  # decay-table database.  Both are expected to be present when running HYDJET.
  cp RunInputHydjet particles.data "$INSTALLROOT/share/hydjetcpp/"
  cp -r RootMacros "$INSTALLROOT/share/hydjetcpp/"
}
