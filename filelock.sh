package: filelock
description: filelock platform-independent file locking for Python
version: "3.16.1"
tag: "3.16.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/filelock-3.16.1.tar.gz
requires:
  - Python
  - setuptools
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Unlicense
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################