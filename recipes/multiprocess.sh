package: multiprocess
description: multiprocess better multiprocessing and dill-based pickling
version: "0.70.16"
tag: "0.70.16"
requires:
  - Python
  - dill
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