package: imageio
description: imageio library for reading and writing image data
version: "2.37.0"
tag: "2.37.0"
requires:
  - Python
  - pillow
  - numpy
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