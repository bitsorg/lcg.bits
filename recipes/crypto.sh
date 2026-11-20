package: crypto
description: PyCrypto/pycryptodome legacy cryptographic modules
version: "1.4.1"
tag: "1.4.1"
requires:
  - Python
  - naked
  - shellescape
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