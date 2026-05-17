package: nxcals_extraction_api_legacy
description: NXCALS legacy extraction API (CERN)
version: "unknown"
tag: "unknown"
requires:
  - Python
  - setuptools
  - nxcals_data_access_libs
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