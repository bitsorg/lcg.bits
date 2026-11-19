package: yoda
description: YODA (Yet more Objects for Data Analysis) histogram library
version: "2.1.2"
source: https://github.com/hepcedar/yoda
tag: "v%(version)s"
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
  # Cython regenerates the pyext C++ from .pyx: the shipped *.cpp target an old
  # CPython C API and don't compile against Python >= 3.12.
  - cython
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib --pysite"
##############################
function Configure() {
  # Remove every Cython-generated pyext source (one with its .pyx) so make re-runs
  # Cython for all; YODA 1.9's hand-written errors.cpp has no .pyx and stays.
  local _f
  for _f in pyext/yoda/*.cpp pyext/yoda/*.h; do
    if [[ -f ${_f%.*}.pyx ]]; then rm -f "$_f"; fi
  done
  # macOS: build.py's g++ -shared links the pyext .so with no header pad, so bits'
  # relocation install_name_tool overflows silently; pass the pad via CXXFLAGS.
  # -Wno-register is needed for the Cython-generated C++.
  local _cxxflags="-Wno-register $(bits_macos_relocatable_ldflags)"
  # Flags mirror lcgcmake's YODA >= 2.1.0 build.
  ./configure --prefix=$INSTALLROOT \
    CXXFLAGS="$_cxxflags" \
    --with-boost="${BOOST_ROOT}" \
    --with-hdf5="${HDF5_ROOT}/bin/h5cc" \
    --with-highfive="${HIGHFIVE_ROOT}" \
    PYTHON="${PYTHON_ROOT:+${PYTHON_ROOT}/bin/python3}"
}
