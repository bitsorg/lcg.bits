package: ruff
description: Ruff extremely fast Python linter and formatter (Rust-based)
version: "0.15.9"
tag: "0.15.9"
requires:
  - rust
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
