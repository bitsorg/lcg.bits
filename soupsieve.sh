package: soupsieve
description: soupsieve CSS selector library for Beautiful Soup 4
version: "2.4.1"
tag: "2.4.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/soupsieve-2.4.1.tar.gz
requires:
  - Python
  - pip
  - build
  - virtualenv
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