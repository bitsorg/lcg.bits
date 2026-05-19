package: py_lz4
description: lz4 Python bindings for the LZ4 compression library
version: "4.4.5"
tag: "4.4.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/py_lz4-4.4.5.tar.gz
requires:
  - Python
  - setuptools_scm
  - lz4
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################