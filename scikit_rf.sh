package: scikit_rf
description: scikit_rf Python package
version: "1.1.0"
tag: "1.1.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/scikit_rf-1.1.0.tar.gz
requires:
  - Python
  - pip
  - numba
  - scipy
  - pandas
  - python_dateutil
  - pytz
  - tzdata
  - six
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