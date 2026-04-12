package: nanobind
description: nanobind Python package
version: "2.10.2"
tag: "2.10.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/nanobind-2.10.2.tar.gz
requires:
  - Python
  - pip
  - CMake
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