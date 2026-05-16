package: argon2_cffi
description: argon2-cffi Argon2 password hashing Python bindings
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
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################