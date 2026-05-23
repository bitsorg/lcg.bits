package: pandas
description: pandas data analysis and manipulation library
version: "2.2.3"
tag: "2.2.3"
requires:
  - Python
  - setuptools_scm
  - pytz
  - python_dateutil
  - numpy
  - cython
  - hypothesis
  - odfpy
  - openpyxl
  - xlrd
  - tzdata
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################