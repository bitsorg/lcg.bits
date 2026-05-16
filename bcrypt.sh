package: bcrypt
description: bcrypt password hashing library for Python
version: "5.0.0"
tag: "5.0.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/bcrypt-5.0.0.tar.gz
requires:
  - Python
  - setuptools
  - six
  - cffi
build_requires:
  - bits-recipe-tools
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################