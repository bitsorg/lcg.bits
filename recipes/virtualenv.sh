package: virtualenv
description: virtualenv tool to create isolated Python environments
version: "21.14.13"
tag: "21.14.13"
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