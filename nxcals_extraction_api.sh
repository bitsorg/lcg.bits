package: nxcals_extraction_api
description: nxcals_extraction_api Python package
version: ""${NXCALS_PYTHON_VERSION}""
tag: ""${NXCALS_PYTHON_VERSION}""
requires:
  - Python
  - setuptools
  - nxcals_data_access_libs
  - spark
  - numpy
  - pip
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