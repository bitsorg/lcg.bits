package: terminado
description: terminado Python package
version: "0.18.1"
tag: "0.18.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/terminado-0.18.1.tar.gz
requires:
  - Python
  - setuptools
  - tornado
  - ptyprocess
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