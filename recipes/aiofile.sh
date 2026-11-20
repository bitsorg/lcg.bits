package: aiofile
description: aiofile async file operations for Python asyncio
version: "3.9.0"
tag: "3.9.0"
requires:
  - Python
  - caio
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