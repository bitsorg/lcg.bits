package: appdirs
description: appdirs platform-appropriate application directories
version: "1.4.4"
tag: "1.4.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/appdirs-1.4.4.tar.gz
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