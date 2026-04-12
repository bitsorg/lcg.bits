package: nxcals_extraction_api_legacy
description: nxcals_extraction_api_legacy Python package
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
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################