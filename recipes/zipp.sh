package: zipp
description: zipp backport of zipfile.Path from Python 3.8+
version: "3.20.2"
tag: "3.20.2"
requires:
  - Python
  - toml
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