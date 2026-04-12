package: svgpath
description: svgpath Python package
version: "6.3"
tag: "6.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/svg.path-6.3.tar.gz
requires:
  - Python
  - setuptools
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################