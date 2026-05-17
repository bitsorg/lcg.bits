package: railroad_diagrams
description: railroad-diagrams SVG railroad diagram generator
version: "1.1.1"
tag: "1.1.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/railroad-diagrams-1.1.1.tar.gz
requires:
  - Python
  - setuptools
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: CC0-1.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################