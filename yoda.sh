package: yoda
description: YODA (Yet more Objects for Data Analysis) histogram library
version: "2.1.2"
tag: "2.1.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/YODA-2.1.2.tar.gz
requires:
  - Python
  - ROOT
  # YODA >= 2.1.0 adds an HDF5/HighFive writer backend (lcgcmake passes
  # --with-hdf5/--with-highfive); Boost is used by the build.
  - Boost
  - hdf5
  - highfive
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
  # Cython is needed at build time to regenerate the pyext C++ from the .pyx
  # sources: the *.cpp shipped in the tarball target an old CPython C API and do
  # not compile against Python >= 3.12 (3.13 here).
  - cython
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
. $(bits-include BitsPython)
##############################
MODULE_OPTIONS="--bin --lib --pysite"
##############################
function Configure() {
  # macOS: gated off on request (builds were failing on the clang-21 / macOS-26
  # SDK toolchain). Produce an empty package; remove the guards here (and in
  # Make/MakeInstall) to resume. NOTE: yoda is required by rivet, professor and
  # fastnlo_toolkit, which will not build against an empty yoda on macOS.
  [ "$(uname)" = Darwin ] && { mkdir -p "$INSTALLROOT"; return 0; }
  # Put the bits Cython on PATH/PYTHONPATH so configure rebuilds the pyext C++
  # from the .pyx (the shipped *.cpp use CPython internals removed in 3.12/3.13).
  bits_enable_cython
  # Remove every generated pyext source so make re-runs Cython for all of them
  # (configure's "force rebuild" only touches core.pyx, leaving the rest stale).
  rm -f pyext/yoda/*.cpp pyext/yoda/*.h
  # Flags mirror lcgcmake's YODA >= 2.1.0 build.
  ./configure --prefix=$INSTALLROOT \
    CXXFLAGS=-Wno-register \
    --with-boost="${BOOST_ROOT}" \
    --with-hdf5="${HDF5_ROOT}/bin/h5cc" \
    --with-highfive="${HIGHFIVE_ROOT}" \
    PYTHON="${PYTHON_ROOT:+${PYTHON_ROOT}/bin/python3}"
}
function Make() {
  [ "$(uname)" = Darwin ] && return 0
  make ${JOBS:+-j $JOBS}
}
function MakeInstall() {
  [ "$(uname)" = Darwin ] && return 0
  make install
}
