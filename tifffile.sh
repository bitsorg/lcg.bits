package: tifffile
description: tifffile read/write TIFF files using numpy arrays
version: "2023.4.12"
tag: "2023.4.12"
requires:
  - Python
  - numpy
  - numcodecs
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