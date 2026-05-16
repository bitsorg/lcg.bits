package: executing
description: executing get the currently executing AST node
version: "2.1.0"
tag: "2.1.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/executing-2.1.0.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################