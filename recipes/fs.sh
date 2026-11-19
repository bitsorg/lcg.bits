package: fs
description: PyFilesystem2 filesystem abstraction layer for Python
version: "2.4.16"
tag: "2.4.16"
requires:
  - Python
  - six
  - appdirs
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