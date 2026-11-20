package: notebook_shim
description: notebook-shim compatibility shim for Jupyter Notebook extensions
version: "0.2.4"
tag: "0.2.4"
requires:
  - Python
  - jupyter_server
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