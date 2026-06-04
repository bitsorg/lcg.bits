package: fastjsonschema
description: fastjsonschema fast JSON Schema validator for Python
version: "2.17.1"
tag: "2.17.1"
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################