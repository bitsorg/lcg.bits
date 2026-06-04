package: jupyterlab_widgets
description: jupyterlab_widgets JupyterLab extension for ipywidgets
version: "3.0.15"
tag: "3.0.15"
requires:
  - Python
  - jupyter_packaging
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