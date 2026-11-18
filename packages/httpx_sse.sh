package: httpx_sse
description: httpx-sse Server-Sent Events support for HTTPX
version: "0.4.0"
tag: "0.4.0"
requires:
  - Python
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