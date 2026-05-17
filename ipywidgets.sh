package: ipywidgets
description: ipywidgets interactive HTML widgets for Jupyter notebooks
version: "8.1.7"
tag: "8.1.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ipywidgets-8.1.7.tar.gz
requires:
  - Python
  - setuptools
  - ipython
  - widgetsnbextension
  - traitlets
  - ipykernel
  - nbformat
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