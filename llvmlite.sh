package: llvmlite
description: llvmlite library/tool (from LCG software stack)
version: "0.46.0rc1"
tag: "0.46.0rc1"
requires:
  - Python
  - setuptools
  - pip
  - wheel
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