package: durationpy
description: durationpy convert strings to Python timedelta objects
version: "0.10"
tag: "0.10"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/durationpy-0.10.tar.gz
requires:
  - Python
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