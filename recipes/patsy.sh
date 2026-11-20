package: patsy
description: Patsy mini-language for describing statistical models
version: "0.5.6"
tag: "0.5.6"
requires:
  - Python
  - numpy
  - pandas
  - six
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-2-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################