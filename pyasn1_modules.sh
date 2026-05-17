package: pyasn1_modules
description: pyasn1_modules collection of pre-built ASN.1 data structures
version: "0.4.1"
tag: "0.4.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pyasn1-modules-0.4.1.tar.gz
requires:
  - Python
  - setuptools
  - pyasn1
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-2-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################