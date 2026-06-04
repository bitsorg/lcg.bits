package: pyslha
description: pyslha Python reader/writer for SUSY Les Houches Accord files
version: "3.2.6"
tag: "3.2.6"
requires:
  - Python
  - tex2pix
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: GPL-2.0-or-later
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################