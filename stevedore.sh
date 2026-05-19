package: stevedore
description: stevedore manage dynamic plugins for Python
version: "3.3.0"
tag: "3.3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/stevedore-3.3.0.tar.gz
requires:
  - Python
  - pbr
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################