package: loky
description: loky robust and reusable process pool executor
version: "3.5.6"
tag: "3.5.6"
requires:
  - Python
  - cloudpickle
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