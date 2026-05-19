package: rsa
description: rsa pure-Python RSA cryptography implementation
version: "4.0"
tag: "4.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/rsa-4.0.tar.gz
requires:
  - Python
  - pyasn1
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
patches:
  - rsa-4.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################