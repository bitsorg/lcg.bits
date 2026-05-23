package: mplhep
description: mplhep Matplotlib style sheets and helpers for HEP publications
version: "1.0.0"
tag: "1.0.0"
requires:
  - Python
  - uhi
  - numpy
  - mplhep_data
  - matplotlib
  - packaging
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