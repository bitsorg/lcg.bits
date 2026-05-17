package: ppft
description: ppft distributed and parallel Python
version: "1.7.7"
tag: "1.7.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ppft-1.7.7.tar.gz
requires:
  - Python
  - setuptools
  - dill
  - six
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