package: click_option_group
description: click-option-group option grouping for the Click CLI library
version: "0.5.7"
tag: "0.5.7"
requires:
  - Python
  - click
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
