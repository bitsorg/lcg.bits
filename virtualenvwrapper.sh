package: virtualenvwrapper
description: virtualenvwrapper extensions to virtualenv
version: "6.1.1"
tag: "6.1.1"
requires:
  - Python
#  - virtualenv
#  - virtualenv_clone
#  - stevedore
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
