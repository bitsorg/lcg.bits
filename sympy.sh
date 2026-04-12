package: sympy
description: sympy Python package
version: "1.14.0"
tag: "1.14.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/sympy-1.14.0.tar.gz
requires:
  - Python
  - setuptools
  - mpmath
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