package: pyasn1_modules
description: pyasn1_modules collection of pre-built ASN.1 data structures
version: "0.4.1"
tag: "0.4.1"
requires:
  - Python
  - pyasn1
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-2-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################