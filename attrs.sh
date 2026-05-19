package: attrs
description: attrs Python classes without boilerplate
version: "25.1.0"
tag: "25.1.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/attrs-25.1.0.tar.gz
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