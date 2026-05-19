package: identify
description: identify file identification library for Python
version: "2.5.24"
tag: "2.5.24"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/identify-2.5.24.tar.gz
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