package: gosam
description: GoSam automated one-loop amplitude generator
version: "2.1.2"
tag: "2.1.2"
requires:
  - Python
  - setuptools
  - pip
  - gosam_contrib
  - qgraf
  - FORM
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
