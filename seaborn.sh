package: seaborn
description: seaborn statistical data visualization based on matplotlib
version: "0.13.2"
tag: "0.13.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/seaborn-0.13.2.tar.gz
requires:
  - Python
  - numpy
  - scipy
  - pandas
  - matplotlib
  - statsmodels
  - pip
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