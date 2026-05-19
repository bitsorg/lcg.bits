package: jupyterlab_widgets
description: jupyterlab_widgets JupyterLab extension for ipywidgets
version: "3.0.15"
tag: "3.0.15"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jupyterlab_widgets-3.0.15.tar.gz
requires:
  - Python
  - jupyter_packaging
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################