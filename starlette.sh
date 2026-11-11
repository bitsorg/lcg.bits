package: starlette
description: Starlette lightweight async web framework for Python
version: "1.3.1"
tag: "1.3.1"
requires:
  - Python
  - anyio
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
