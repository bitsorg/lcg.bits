package: mpmath
description: mpmath Python library for arbitrary-precision arithmetic
version: "1.2.1"
tag: "1.2.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/mpmath-1.2.1.tar.gz
requires:
  - Python
  - setuptools
  - setuptools_scm
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################