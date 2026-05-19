package: MarkupSafe
description: MarkupSafe safely handles HTML/XML markup in Python
version: "2.1.5"
tag: "2.1.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/MarkupSafe-2.1.5.tar.gz
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