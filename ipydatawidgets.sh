package: ipydatawidgets
description: ipydatawidgets Jupyter widgets for n-dimensional arrays
version: "4.3.5"
tag: "4.3.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ipydatawidgets-4.3.5.tar.gz
requires:
  - Python
  - setuptools
  - traittypes
  - ipywidgets
  - numpy
  - six
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