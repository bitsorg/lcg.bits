package: blosc2
description: Python-Blosc2 next-gen Python bindings for C-Blosc2
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
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################