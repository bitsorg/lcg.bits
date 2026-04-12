package: tifffile
description: tifffile Python package
version: "2023.4.12"
tag: "2023.4.12"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tifffile-2023.4.12.tar.gz
requires:
  - Python
  - pip
  - setuptools
  - numpy
  - numcodecs
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