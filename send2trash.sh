package: send2trash
description: send2trash cross-platform move-to-trash for Python
version: "1.8.3"
tag: "1.8.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Send2Trash-1.8.3.tar.gz
requires:
  - Python
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