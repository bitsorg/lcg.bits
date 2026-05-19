package: jiter
description: jiter fast JSON iterator for Python (Rust-backed)
version: "0.11.0"
tag: "0.11.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/jiter-0.11.0.tar.gz
requires:
  - Python
  - rust
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
export CARGO_HOME="${BUILDDIR}/.cargo"
export CC="${CC:-cc}"
export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER="${CC}"
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################