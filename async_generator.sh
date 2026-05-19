package: async_generator
description: async_generator async generators for Python 3.5+
version: "1.10"
tag: "1.10"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/async_generator-1.10.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT OR Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################