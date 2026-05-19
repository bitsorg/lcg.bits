package: pythonsollya
description: Python-Sollya Python interface to the Sollya library
version: "0.3"
tag: "0.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pythonsollya-release-0.3.tar.gz
requires:
  - Python
  - cython
  - mpfi
  - sollya
  - six
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LGPL-3.0-or-later
patches:
  - pythonsollya-0.3.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################