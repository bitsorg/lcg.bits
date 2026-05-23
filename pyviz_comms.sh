package: pyviz_comms
description: pyviz_comms Jupyter communication framework for HoloViews
version: "2.0.1"
tag: "2.0.1"
requires:
  - Python
  - param
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