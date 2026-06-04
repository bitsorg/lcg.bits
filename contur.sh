package: contur
description: Contur automated LHC BSM model constraint tool
version: "3.1.3"
tag: "3.1.3"
requires:
  - Python
  - numpy
  - scipy
  - pandas
  - configobj
  - matplotlib
  - tqdm
  - pytest
  - PyYAML
  - pyslha
  - scikitlearn
  - click
  - pathos
  - uncertainties
  - pymysql
  - sqlparse
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-3.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
