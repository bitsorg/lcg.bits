package: boost_histogram
description: boost_histogram Python package
version: "1.7.1"
tag: "1.7.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/boost_histogram-1.7.1.tar.gz
requires:
  - Python
  - pip
  - numpy
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