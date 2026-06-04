package: pipenv
description: Pipenv Python virtualenv + pip workflow tool
version: "2024.4.0"
tag: "2024.4.0"
requires:
  - Python
  - certifi
  - virtualenv
  - virtualenv_clone
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