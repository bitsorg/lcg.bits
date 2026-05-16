package: pypi_arrow
description: pypi-arrow PyPI package status tracker
version: "1.3.0"
tag: "1.3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pypi_arrow-1.3.0.tar.gz
requires:
  - Python
  - pip
  - types_python_dateutil
  - python_dateutil
build_requires:
  - bits-recipe-tools
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################