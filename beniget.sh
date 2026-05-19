package: beniget
description: beniget Python AST def-use chains analyser
version: "0.4.2.post1"
tag: "0.4.2.post1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/beniget-0.4.2.post1.tar.gz
requires:
  - Python
  - gast
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