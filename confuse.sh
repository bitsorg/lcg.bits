package: confuse
description: Confuse configuration library for Python apps
version: "2.0.1"
tag: "2.0.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/confuse-2.0.1.tar.gz
requires:
  - Python
  - setuptools
  - pip
  - PyYAML
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################