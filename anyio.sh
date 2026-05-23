package: anyio
description: AnyIO asynchronous networking and concurrency library
version: "4.6.1"
tag: "4.6.1"
requires:
  - Python
  - idna
  - exceptiongroup
  # optional:
  # - sniffio
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