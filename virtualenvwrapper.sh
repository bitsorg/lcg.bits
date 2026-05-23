package: virtualenvwrapper
description: virtualenvwrapper extensions to virtualenv
version: "4.8.4"
tag: "4.8.4"
requires:
  - Python
  - virtualenv
  - virtualenv_clone
  - stevedore
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