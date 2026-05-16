package: svgpath
description: svgpath SVG path parsing and manipulation for Python
version: "6.3"
tag: "6.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/svg.path-6.3.tar.gz
requires:
  - Python
  - setuptools
build_requires:
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################