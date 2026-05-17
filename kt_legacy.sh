package: kt_legacy
description: kt-legacy k_T jet clustering legacy routines
version: "1.0.5"
tag: "1.0.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/kt_legacy-1.0.5.tar.gz
requires:
  - Python
  - setuptools
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################