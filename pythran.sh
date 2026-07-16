package: pythran
description: Pythran ahead-of-time compiler for Python scientific code
version: "0.17.0"
source: https://github.com/serge-sans-paille/pythran
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
  - beniget
  - gast
  - numpy
  - ply
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
patches:
  - pythran-0.17.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################