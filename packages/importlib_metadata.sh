package: importlib_metadata
description: importlib_metadata backport of importlib.metadata
version: "9.0.0"
tag: "9.0.0"
requires:
  - Python
  - setuptools_scm
  - six
  - zipp
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