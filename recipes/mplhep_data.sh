package: mplhep_data
description: mplhep-data data files (experiment logos etc.) for mplhep
version: "0.0.4"
tag: "0.0.4"
requires:
  - Python
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