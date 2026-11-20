package: httpcore
description: httpcore minimal HTTP client implementation
version: "1.0.7"
tag: "1.0.7"
requires:
  - Python
  - anyio
  - certifi
  - h11
  - sniffio
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