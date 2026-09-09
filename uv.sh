package: uv
description: uv extremely fast Python package installer and resolver (Rust-based)
version: "0.11.21"
tag: "0.11.21"
requires:
  - rust
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0 OR MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
