package: distlib
description: distlib low-level Python packaging library
version: "0.3.9"
tag: "0.3.9"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/distlib-0.3.9.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Python-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################