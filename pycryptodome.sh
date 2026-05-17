package: pycryptodome
description: PyCryptodome standalone Python cryptography library
version: "3.21.0"
tag: "3.21.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/pycryptodome-3.21.0.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-2-Clause AND Public Domain
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################