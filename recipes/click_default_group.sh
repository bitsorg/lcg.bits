package: click_default_group
description: click-default-group default group for Click commands
version: "1.2.4"
tag: "1.2.4"
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
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################