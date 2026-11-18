package: zfit_interface
description: zfit-interface abstract interface definitions for zfit
version: "0.0.3"
tag: "0.0.3"
requires:
  - Python
  - uhi
  - numpy
  - typing_extensions
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