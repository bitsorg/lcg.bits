package: colorama
description: Colorama cross-platform colored terminal text for Python
version: "0.4.6"
tag: "0.4.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/colorama-0.4.6.tar.gz
requires:
  - Python
  - pip
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