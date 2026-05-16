package: notebook_shim
description: notebook-shim compatibility shim for Jupyter Notebook extensions
version: "0.2.4"
tag: "0.2.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/notebook_shim-0.2.4.tar.gz
requires:
  - Python
  - pip
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