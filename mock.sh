package: mock
description: mock Python mocking and patching library
version: "3.0.5"
tag: "3.0.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/mock-3.0.5.tar.gz
requires:
  - Python
  - setuptools
  - six
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-2-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################