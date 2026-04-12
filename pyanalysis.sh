package: pyanalysis
description: pyanalysis Python package
version: "2.0"
tag: "2.0"
requires:
  - matplotlib
  - numpy
  - pyparsing
  - scipy
  - sympy
  - pytz
  - numexpr
  - scikitlearn
  - elasticsearch
  - hepdata_converter
  - hepdata_validator
  - joblib
  - uncertainties
  - iminuit
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