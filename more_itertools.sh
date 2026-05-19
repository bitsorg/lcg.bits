package: more_itertools
description: more-itertools extensions to Python's itertools
version: "10.6.0"
tag: "10.6.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/more-itertools-10.6.0.tar.gz
requires:
  - Python
  - six
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