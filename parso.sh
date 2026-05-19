package: parso
description: parso Python parser that supports error recovery
version: "0.8.4"
tag: "0.8.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/parso-0.8.4.tar.gz
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