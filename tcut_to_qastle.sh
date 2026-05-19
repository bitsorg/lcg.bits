package: tcut_to_qastle
description: tcut_to_qastle convert ROOT TCut strings to qastle
version: "0.7"
tag: "0.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tcut_to_qastle-0.7.tar.gz
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
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################