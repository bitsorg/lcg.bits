package: black
description: Black uncompromising Python code formatter
version: "26.10.1"
sbom: tool
tag: "26.10.1"
requires:
  - Python
  - click
  - mypy_extensions
  - packaging
  - pathspec
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