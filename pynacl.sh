package: pynacl
description: PyNaCl Python binding to libsodium (NaCl)
version: "1.5.0"
tag: "1.5.0"
requires:
  - Python
  - six
  - cffi
  - pycparser
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################