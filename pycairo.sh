package: pycairo
description: Pycairo Python bindings for the Cairo library
version: "1.28.0"
tag: "1.28.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pycairo-1.28.0.tar.gz
requires:
  - Python
  - setuptools
  - cairo
  - pip
build_requires:
  - bits-recipe-tools
license: LGPL-2.1-only OR MPL-1.1
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################