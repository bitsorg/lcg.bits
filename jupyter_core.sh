package: jupyter_core
description: jupyter_core base package for Jupyter projects
version: "5.7.2"
tag: "5.7.2"
requires:
  - Python
  - traitlets
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