package: wcwidth
description: wcwidth Python port of wcwidth(3) for wide character support
version: "0.2.5"
tag: "0.2.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/wcwidth-0.2.5.tar.gz
requires:
  - Python
  - pip
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