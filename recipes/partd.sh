package: partd
description: Partd key-value append store on disk for Dask
version: "1.4.2"
tag: "1.4.2"
requires:
  - Python
  - locket
  - toolz
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################