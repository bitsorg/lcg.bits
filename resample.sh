package: resample
description: resample resampling algorithms for Python
version: "1.10.1"
tag: "1.10.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/resample-1.10.1.tar.gz
requires:
  - Python
  - numpy
  - scipy
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