package: jupyter_packaging
description: jupyter_packaging tools for building Jupyter packages
version: "0.12.3"
tag: "0.12.3"
requires:
  - Python
  - packaging
  - deprecation
  - tomlkit
  - wheel
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