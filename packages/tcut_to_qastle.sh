package: tcut_to_qastle
description: tcut_to_qastle convert ROOT TCut strings to qastle
version: "0.7"
tag: "0.7"
requires:
  - Python
  - qastle
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################