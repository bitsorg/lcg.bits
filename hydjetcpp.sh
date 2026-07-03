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
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin"
##############################
function Prepare() {
  # The ZIP has all files at the archive root (no wrapping dir); bits' strip=1
  # would drop them, so download + unzip manually.
  curl -fSL \
    "https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/HYDJET++2_1.ZIP" \
    -o HYDJET++2_1.ZIP
  unzip -q HYDJET++2_1.ZIP
  rm -f HYDJET++2_1.ZIP
}
function Make() {
  # Plain Makefile needs root-config on PATH and F77LIBSO at the gfortran shared lib; -std=legacy lets the bundled PYQUEN Fortran compile
  _libgf=libgfortran.so; bits_is_macos && _libgf=libgfortran.dylib
  # macOS: the Makefile globs a hardcoded BINDIRS for gfortran, missing Homebrew's
  # /opt/homebrew/bin; prepend gfortran's actual directory.
  local _bindirs=()
  if bits_is_macos; then
    local _fcdir; _fcdir=$(dirname "$(command -v ${FC:-gfortran})")
    _bindirs=(BINDIRS="${_fcdir} . /bin /usr/bin /usr/local/bin")
  fi
  PATH="${ROOT_ROOT:+$ROOT_ROOT/bin:}$PATH" \
    make ${JOBS:+-j $JOBS} "${_bindirs[@]}" \
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
