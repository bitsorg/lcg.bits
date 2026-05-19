package: deprecated
description: Deprecated Python @deprecated decorator
version: "1.2.13"
tag: "1.2.13"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Deprecated-1.2.13.tar.gz
requires:
  - Python
  - wrapt
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