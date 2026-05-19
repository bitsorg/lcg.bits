package: zstandard
description: zstandard Python bindings for Zstandard compression
version: "0.23.0"
tag: "0.23.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/zstandard-0.23.0.tar.gz
requires:
  - Python
  - cffi
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
export CC="${CC:-cc}"
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
