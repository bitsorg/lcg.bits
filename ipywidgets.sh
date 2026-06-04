package: ipywidgets
description: ipywidgets interactive HTML widgets for Jupyter notebooks
version: "8.1.7"
tag: "8.1.7"
requires:
  - Python
  - ipython
  - widgetsnbextension
  - traitlets
  - ipykernel
  - nbformat
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