package: trio
description: Trio async concurrency library for Python
version: "0.28.0"
tag: "0.28.0"
requires:
  - Python
  - attrs
  - sniffio
  - sortedcontainers
  - idna
  - outcome
  - exceptiongroup
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT OR Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################