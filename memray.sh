package: memray
description: memray memory profiler for Python
version: "1.19.2"
tag: "1.19.2"
requires:
  - Python
  # libunwind is Linux-oriented (GNU stack unwinding) and is disabled on
  # macOS; gate the requirement so it drops from the osx graph.
  - "libunwind:(?!osx)"
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