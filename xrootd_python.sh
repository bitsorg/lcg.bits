package: xrootd_python
description: xrootd-python Python bindings for XRootD
version: "unknown"
tag: "unknown"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/xrootd-python-unknown.tar.gz
requires:
  - Python
  - xrootd
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-3.0-or-later
---
#!/bin/bash -e
export XRD_LIBDIR="${XROOTD_ROOT}/lib"
export XRD_INCDIR="${XROOTD_ROOT}/include/xrootd"
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################