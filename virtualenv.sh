package: virtualenv
description: virtualenv tool to create isolated Python environments
version: "20.28.0"
tag: "20.28.0"
requires:
  - Python
  - appdirs
  - distlib
  - filelock
  - six
  - platformdirs
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