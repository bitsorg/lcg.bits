package: blosc
description: Python-Blosc high-performance compressor bindings
version: "1.11.4"
tag: "1.11.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/blosc-1.11.4.tar.gz
requires:
  - Python
  - setuptools
  - wheel
  - scikitbuild
  - CMake
  - ninja
  - numpy
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
patches:
  - blosc-1.11.4.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################