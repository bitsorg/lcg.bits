package: svgpathtools
description: svgpathtools tools for SVG path data manipulation
version: "1.6.1"
tag: "1.6.1"
requires:
  - Python
  - numpy
  - scipy
  - svgwrite
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