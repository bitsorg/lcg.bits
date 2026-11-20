package: tenacity
description: Tenacity general-purpose Python retry library
version: "9.0.0"
tag: "9.0.0"
requires:
  - Python
  - setuptools_scm
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