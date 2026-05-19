package: naked
description: Naked Python framework and tools for CLI application development
version: "0.1.32"
tag: "0.1.32"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Naked-0.1.32.tar.gz
requires:
  - Python
  - PyYAML
  - requests
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