package: oracledb
description: python-oracledb Oracle Database driver for Python
version: "3.4.2"
tag: "3.4.2"
requires:
  - Python
  - oracle
  - cryptography
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
redistributable: false
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################