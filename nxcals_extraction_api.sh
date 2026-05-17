package: nxcals_extraction_api
description: NXCALS data extraction API (CERN)
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
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################