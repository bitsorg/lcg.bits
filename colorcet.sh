package: colorcet
description: Colorcet collection of perceptually uniform colormaps
version: "3.1.0"
tag: "3.1.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/colorcet-3.1.0.tar.gz
requires:
  - Python
  - setuptools
  - pyct
build_requires:
  - bits-recipe-tools
license: CC-BY-4.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################