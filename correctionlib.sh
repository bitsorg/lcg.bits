package: correctionlib
description: correctionlib schema-based correction evaluation library
version: "2.8.0"
source: https://github.com/cms-nanoAOD/correctionlib
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
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
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
patches:
  - correctionlib-2.8.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
