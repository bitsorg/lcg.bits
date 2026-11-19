package: pluggy
description: pluggy plugin and hook calling mechanism for Python
version: "1.5.0"
tag: "1.5.0"
requires:
  - Python
  - setuptools_scm
  - importlib_metadata
  - zipp
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################