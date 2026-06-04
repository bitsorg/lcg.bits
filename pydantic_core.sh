package: pydantic_core
description: pydantic-core Rust-backed core for Pydantic v2
version: "2.41.5"
tag: "2.41.5"
requires:
  - Python
  - typing_extensions
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