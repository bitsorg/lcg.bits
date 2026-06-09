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
  # Put the bits Cython on PATH/PYTHONPATH so configure rebuilds the pyext C++
  # from the .pyx (the shipped *.cpp use CPython internals removed in 3.12/3.13).
  bits_enable_cython
  # Remove every generated pyext source so make re-runs Cython for all of them
  # (configure's "force rebuild" only touches core.pyx, leaving the rest stale).
  rm -f pyext/yoda/*.cpp pyext/yoda/*.h
  # macOS: the recipe's own build succeeds (libYODA.dylib + core.so/util.so),
  # but bits' post-build relocation then fails: it runs
  # `install_name_tool -id <long final path>` on the Python extensions, and
  # YODA links those via build.py's single `g++ -shared` command with no Mach-O
  # header padding, so the longer install name overflows the load commands
  # ("doesn't fit"). bits reports BUILD FAILED even though the recipe log ends in
  # `return 0`. Reserve the header pad via CXXFLAGS, which flows through
  # PYEXT_CXXFLAGS into the extension link. (-Wl,... is harmless at compile and
  # is needed at the .so link.) -Wno-register is still required for the
  # Cython-generated C++. Linux uses GNU ld and must not get this macOS flag.
  local _cxxflags=-Wno-register
  [ "$(uname)" = Darwin ] && _cxxflags="-Wno-register -Wl,-headerpad_max_install_names"
  # Flags mirror lcgcmake's YODA >= 2.1.0 build.
  ./configure --prefix=$INSTALLROOT \
    CXXFLAGS="$_cxxflags" \
    --with-boost="${BOOST_ROOT}" \
    --with-hdf5="${HDF5_ROOT}/bin/h5cc" \
    --with-highfive="${HIGHFIVE_ROOT}" \
    PYTHON="${PYTHON_ROOT:+${PYTHON_ROOT}/bin/python3}"
}
