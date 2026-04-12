package: jupyterlab_widgets
description: jupyterlab_widgets Python package
version: "3.0.15"
tag: "3.0.15"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jupyterlab_widgets-3.0.15.tar.gz
requires:
  - Python
  - setuptools
  - jupyter_packaging
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################