package: pandas
description: pandas data analysis and manipulation library
version: "2.2.3"
tag: "2.2.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pandas-2.2.3.tar.gz
requires:
  - Python
  - setuptools
  - setuptools_scm
  - pytz
  - python_dateutil
  - numpy
  - cython
  - hypothesis
  - odfpy
  - openpyxl
  - xlrd
  - pip
  - tzdata
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