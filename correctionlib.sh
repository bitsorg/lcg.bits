package: correctionlib
description: correctionlib schema-based correction evaluation library
version: "2.8.0"
tag: "2.8.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/correctionlib-2.8.0.tar.gz
requires:
  - Python
  - setuptools
  - setuptools_scm
  - pydantic
  - rich
  - numpy
  - scikitbuild
  - CMake
  - zlib
  - ninja
build_requires:
  - bits-recipe-tools
license: BSD-3-Clause
patches:
  - correctionlib-2.8.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################