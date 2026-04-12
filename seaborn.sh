package: seaborn
description: seaborn Python package
version: "0.13.2"
tag: "0.13.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/seaborn-0.13.2.tar.gz
requires:
  - Python
  - setuptools
  - numpy
  - scipy
  - pandas
  - matplotlib
  - statsmodels
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