package: uhi
description: UHI Unified Histogram Indexing protocol (HEP)
version: "0.3.0"
tag: "0.3.0"
requires:
  - Python
  - numpy
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