package: statsmodels
description: statsmodels statistical models and tests for Python
version: "0.14.5"
tag: "0.14.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
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
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################