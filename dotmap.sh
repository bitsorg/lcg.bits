package: dotmap
description: DotMap dot-access dict subclass for Python
version: "1.3.30"
tag: "1.3.30"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/dotmap-1.3.30.tar.gz
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