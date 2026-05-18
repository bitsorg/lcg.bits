package: scikit_build_core
description: scikit-build-core PEP 517 build backend for CMake-based Python packages
version: "0.11.4"
tag: "0.11.4"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/scikit_build_core-0.11.4.tar.gz
requires:
  - Python
  - pip
  - packaging
  - pyproject_metadata
  - tomli
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
