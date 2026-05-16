package: jupyterlab_pygments
description: jupyterlab_pygments Pygments theme for JupyterLab
version: "0.3.0"
tag: "0.3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jupyterlab_pygments-0.3.0.tar.gz
requires:
  - Python
  - setuptools
  - pygments
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