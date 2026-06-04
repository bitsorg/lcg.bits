package: luigi
description: Luigi workflow management system for data pipelines
version: "3.6.0"
tag: "3.6.0"
requires:
  - Python
  - tornado
  - tenacity
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