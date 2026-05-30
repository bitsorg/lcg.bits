package: yoda
description: YODA (Yet more Objects for Data Analysis) histogram library
version: "1.9.0"
tag: "1.9.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MCGeneratorsTarFiles/YODA-1.9.0.tar.gz
requires:
  - Python
  - ROOT
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include AutoToolsRecipe)
##############################
MODULE_OPTIONS="--bin --lib --pysite"
##############################
function Configure() {
  # Pass PYTHON explicitly so configure doesn't try to find "python$PYTHON_VERSION"
  # (e.g. python3.13.11) when PYTHON_VERSION is set to the full version string.
  # YODA 1.9.0 does not use Boost; drop the unrecognised --with-boost option.
  #
  # -DCYTHON_USE_PYLONG_INTERNALS=0: the shipped Cython-generated pyext sources
  # (pyext/yoda/{core,util,rootcompat}.cpp) were produced by an old Cython that,
  # on CPython, enables CYTHON_USE_PYLONG_INTERNALS and #includes "longintrepr.h".
  # That header was moved off the public include path in Python 3.12 and is gone
  # in 3.13, so the build fails with "longintrepr.h: No such file or directory".
  # Each file only sets the macro to 1 behind `#elif !defined(...)`, so defining
  # it to 0 here disables the PyLong fast-paths (Cython falls back to the public
  # API — same as modern Cython does for >=3.12) and skips the bad include.
  # configure assigns PYEXT_CXXFLAGS=$CXXFLAGS, so this reaches the pyext build.
  ./configure --prefix=$INSTALLROOT \
    CXXFLAGS="-Wno-register -DCYTHON_USE_PYLONG_INTERNALS=0" \
    PYTHON="${PYTHON_ROOT:+${PYTHON_ROOT}/bin/python3}"
}
