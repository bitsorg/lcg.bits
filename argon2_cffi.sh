package: argon2_cffi
description: argon2_cffi Python package
version: "23.1.0"
tag: "23.1.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/argon2_cffi-23.1.0.tar.gz
requires:
  - Python
  - pip
  - cffi
  - six
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################