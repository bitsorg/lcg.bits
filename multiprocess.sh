package: multiprocess
description: multiprocess better multiprocessing and dill-based pickling
version: "0.70.16"
tag: "0.70.16"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/multiprocess-0.70.16.tar.gz
requires:
  - Python
  - dill
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