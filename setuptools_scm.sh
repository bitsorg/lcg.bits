package: setuptools_scm
description: setuptools_scm manages Python package versions from SCM tags
version: "8.2.0"
tag: "8.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/setuptools_scm-8.2.0.tar.gz
requires:
  - Python
  - setuptools
  - pip
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