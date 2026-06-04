package: ptyprocess
description: ptyprocess launch a subprocess in a pseudo terminal (pty)
version: "0.7.0"
tag: "0.7.0"
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: ISC
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################