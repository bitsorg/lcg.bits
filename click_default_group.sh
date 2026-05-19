package: click_default_group
description: click-default-group default group for Click commands
version: "1.2.4"
tag: "1.2.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/click_default_group-1.2.4.tar.gz
requires:
  - Python
  - click
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################