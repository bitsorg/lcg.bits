package: tornado
description: Tornado scalable async network library for Python
version: "6.5.9"
tag: "6.5.9"
requires:
  - Python
  - certifi
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