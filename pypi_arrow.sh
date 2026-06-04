package: pypi_arrow
description: pypi-arrow PyPI package status tracker
version: "1.3.0"
tag: "1.3.0"
requires:
  - Python
  - types_python_dateutil
  - python_dateutil
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
PYPI_NAME="arrow"
MODULE_OPTIONS="--bin --python"
##############################
