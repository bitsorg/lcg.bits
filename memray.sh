package: memray
description: memray memory profiler for Python
version: "1.19.2"
tag: "1.19.2"
requires:
  - Python
  - libunwind
  - lz4
  - Jinja2
  - rich
  - textual
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################