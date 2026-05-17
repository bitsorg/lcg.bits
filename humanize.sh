package: humanize
description: humanize Python humanization utilities
version: "4.0.0"
tag: "4.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/humanize-4.0.0.tar.gz
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