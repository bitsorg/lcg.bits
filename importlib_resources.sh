package: importlib_resources
description: importlib_resources backport of importlib.resources
version: "6.5.2"
tag: "6.5.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/importlib_resources-6.5.2.tar.gz
requires:
  - Python
  - pip
  - zipp
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