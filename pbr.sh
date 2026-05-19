package: pbr
description: PBR Python Build Reasonableness setuptools helper
version: "6.0.0"
tag: "6.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pbr-6.0.0.tar.gz
requires:
  - Python
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