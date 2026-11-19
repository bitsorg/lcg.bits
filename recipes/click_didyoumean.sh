package: click_didyoumean
description: click-didyoumean 'did you mean?' suggestions for Click
version: "0.3.0"
tag: "0.3.0"
requires:
  - Python
  - click
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