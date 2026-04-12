package: blosc2
description: blosc2 Python package
version: "2.7.1"
tag: "2.7.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/blosc2-2.7.1.tar.gz
requires:
  - Python
  - setuptools
  - wheel
  - scikitbuild
  - CMake
  - ninja
  - numpy
  - pycpuinfo
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