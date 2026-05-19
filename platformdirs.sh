package: platformdirs
description: platformdirs get appropriate platform directories
version: "4.3.6"
tag: "4.3.6"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/platformdirs-4.3.6.tar.gz
requires:
  - Python
  - setuptools_scm
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