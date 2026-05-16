package: statsmodels
description: statsmodels statistical models and tests for Python
version: "0.14.5"
tag: "0.14.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/statsmodels-0.14.5.tar.gz
requires:
  - Python
  - setuptools
  - numpy
  - scipy
  - pandas
  - patsy
  - cython
  - matplotlib
  - nose
  - ipython
  - packaging
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