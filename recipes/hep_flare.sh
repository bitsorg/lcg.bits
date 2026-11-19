package: hep_flare
description: hep-flare Dask-aware columnar HEP analysis tools
version: "0.2.2"
tag: "0.2.2"
requires:
  - Python
  - b2luigi
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