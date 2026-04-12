package: svgpathtools
description: svgpathtools Python package
version: "1.6.1"
tag: "1.6.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/svgpathtools-1.6.1.tar.gz
requires:
  - Python
  - setuptools
  - numpy
  - scipy
  - svgwrite
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