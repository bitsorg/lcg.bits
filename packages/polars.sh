package: polars
description: Polars fast DataFrame library for Python (Rust-backed)
version: "0.18.13"
tag: "0.18.13"
requires:
  - Python
  - wheel
  - jemalloc
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