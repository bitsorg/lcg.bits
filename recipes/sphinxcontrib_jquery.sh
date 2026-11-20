package: sphinxcontrib_jquery
description: sphinxcontrib-jquery jQuery for Sphinx HTML themes
version: "4.1"
tag: "4.1"
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-2-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################