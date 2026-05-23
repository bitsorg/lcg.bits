package: hepdata_lib
description: hepdata_lib library for preparing HEPData submissions
version: "0.20.0"
tag: "0.20.0"
requires:
  - Python
  - hepdata_validator
  - PyYAML
  - scipy
  - ROOT
  - hist
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################