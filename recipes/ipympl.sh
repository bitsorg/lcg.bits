package: ipympl
description: ipympl interactive matplotlib backend for Jupyter
version: "0.9.3"
tag: "0.9.3"
requires:
  - Python
  - ipykernel
  - ipywidgets
  - matplotlib
  # optional:
  # - jupyter_packaging
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