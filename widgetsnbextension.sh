package: widgetsnbextension
description: widgetsnbextension IPython widgets for Jupyter notebook
version: "4.0.14"
tag: "4.0.14"
requires:
  - Python
  - notebook
  - jupyter_core
  - traitlets
  - decorator
  - tornado
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