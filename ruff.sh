package: ruff
description: Ruff extremely fast Python linter and formatter (Rust-based)
version: "0.15.9"
tag: "0.15.9"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/ruff-0.15.9.tar.gz
requires:
  - rust
  - Python
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################