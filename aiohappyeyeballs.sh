package: aiohappyeyeballs
description: aiohappyeyeballs Happy Eyeballs async TCP connector
version: "2.4.4"
tag: "2.4.4"
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
