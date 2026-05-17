package: cffi
description: CFFI C Foreign Function Interface for Python
version: "2.0.0"
tag: "2.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/cffi-2.0.0.tar.gz
requires:
  - Python
  - setuptools
  - pycparser
  - libffi
  - pip
  - pkg_config
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
