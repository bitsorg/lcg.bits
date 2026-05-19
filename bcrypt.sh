package: bcrypt
description: bcrypt password hashing library for Python
version: "5.0.0"
tag: "5.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/bcrypt-5.0.0.tar.gz
requires:
  - Python
  - six
  - cffi
  - rust
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
export CC="${CC:-cc}"
export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER="${CC}"
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################