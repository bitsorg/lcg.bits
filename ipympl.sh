package: ipympl
description: ipympl Python package
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
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################