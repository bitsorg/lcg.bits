package: pathos
description: pathos multiprocessing and parallel map for Python
version: "0.2.3"
tag: "0.2.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pathos-0.2.3.tar.gz
requires:
  - Python
  - six
  - multiprocess
  - pox
  - ppft
  - dill
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