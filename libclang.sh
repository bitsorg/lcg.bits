package: libclang
description: libclang C interface to the Clang compiler
version: "18.1.1"
tag: "18.1.1"
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0 WITH LLVM-exception
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################