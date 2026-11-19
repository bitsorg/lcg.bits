package: types_python_dateutil
description: types-python-dateutil type stubs for python-dateutil
version: "2.9.0.20241206"
tag: "2.9.0.20241206"
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################