package: ipympl
description: ipympl interactive matplotlib backend for Jupyter
version: "0.9.3"
tag: "0.9.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ipympl-0.9.3.tar.gz
requires:
  - Python
  - setuptools
  - ipykernel
  - ipywidgets
  - matplotlib
  # optional:
  # - jupyter_packaging
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################