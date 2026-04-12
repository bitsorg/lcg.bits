package: jupyterlab_rise
description: jupyterlab_rise Python package
version: "0.42.0"
tag: "0.42.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jupyterlab_rise-0.42.0.tar.gz
requires:
  - Python
  - pip
  - jupyterlab
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