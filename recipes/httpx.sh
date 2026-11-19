package: httpx
description: HTTPX fully featured async HTTP client for Python
version: "0.28.1"
tag: "0.28.1"
requires:
  - Python
  - certifi
  - httpcore
  - idna
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