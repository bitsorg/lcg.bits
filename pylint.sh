package: pylint
description: Pylint Python static code analysis tool
version: "4.0.5"
tag: "4.0.5"
requires:
  - Python
  - astroid
  - isort
  - mccabe
  - tomlkit
  - dill
  - platformdirs
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################