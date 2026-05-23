package: miniopy_async
description: miniopy-async async MinIO Python client
version: "1.21.1"
tag: "1.21.1"
requires:
  - Python
  - aiofile
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