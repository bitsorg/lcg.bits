package: tqdm
description: tqdm fast, extensible progress bar for Python
version: "4.67.1"
tag: "4.67.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tqdm-4.67.1.tar.gz
requires:
  - Python
  - setuptools
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT AND MPL-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################