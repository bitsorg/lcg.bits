package: jupyterlab
description: JupyterLab next-generation Jupyter web-based interface
version: "4.4.7"
tag: "4.4.7"
requires:
  - ipython
  - packaging
  - tornado
  - jupyter_core
  - traitlets
  - jupyterlab_server
  - jupyter_server
  - nbclassic
  - Jinja2
  # optional:
  # - nodejs
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