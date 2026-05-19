package: decorator
description: decorator Python library to simplify function decorator usage
version: "5.2.1"
tag: "5.2.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/decorator-5.2.1.tar.gz
requires:
  - Python
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