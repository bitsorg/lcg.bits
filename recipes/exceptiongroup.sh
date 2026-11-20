package: exceptiongroup
description: exceptiongroup Python 3.11 ExceptionGroup backport
version: "1.2.2"
tag: "1.2.2"
requires:
  - Python
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
