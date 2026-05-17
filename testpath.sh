package: testpath
description: testpath assertions about paths and files for Python testing
version: "0.6.0"
tag: "0.6.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/testpath-0.6.0.tar.gz
requires:
  - Python
  - setuptools
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################