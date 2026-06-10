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
  # Cython regenerates the pyext C++ from .pyx: the shipped *.cpp target an old
  # CPython C API and don't compile against Python >= 3.12.
  - cython
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
. $(bits-include BitsPython)
. $(bits-include BitsMacOS)
##############################
MODULE_OPTIONS="--bin --lib --pysite"
##############################
function Configure() {
  # bits Cython on PATH/PYTHONPATH so configure rebuilds the pyext C++ from the
  # .pyx (the shipped *.cpp use CPython internals removed in 3.12/3.13).
  bits_enable_cython
  # Remove every generated pyext source so make re-runs Cython for all of them
  # (configure's "force rebuild" only touches core.pyx, leaving the rest stale).
  rm -f pyext/yoda/*.cpp pyext/yoda/*.h
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
