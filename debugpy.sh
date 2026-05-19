package: debugpy
description: debugpy debugger adapter protocol implementation for Python
version: "1.8.1"
tag: "1.8.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/debugpy-1.8.1.zip
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