package: aiosignal
description: aiosignal asyncio-safe list of registered callbacks
version: "1.2.0"
tag: "1.2.0"
requires:
  - Python
  - frozenlist
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