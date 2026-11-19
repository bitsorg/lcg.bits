package: capturer
description: capturer transparently captures stdout/stderr in Python
version: "3.0"
tag: "3.0"
requires:
  - Python
  - humanfriendly
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