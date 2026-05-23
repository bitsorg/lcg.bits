package: hepdata_converter
description: HEPData converter for submission formats
version: "0.3.1"
tag: "0.3.1"
requires:
  - Python
  - matplotlib
  - hepdata_validator
  - PyYAML
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################