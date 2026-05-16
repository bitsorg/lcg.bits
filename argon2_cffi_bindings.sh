package: argon2_cffi_bindings
description: argon2-cffi-bindings low-level Argon2 CFFI bindings
version: "21.2.0"
tag: "21.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/argon2_cffi_bindings-21.2.0.tar.gz
requires:
  - Python
  - pip
  - cffi
  - six
  - pip
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