package: tzlocal
description: tzlocal detect local timezone for Python
version: "2.0.0"
tag: "2.0.0"
requires:
  - Python
  - pytz
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