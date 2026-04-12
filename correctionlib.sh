package: correctionlib
description: correctionlib Python package
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
license: TODO
patches:
  - correctionlib-2.8.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################