package: rsa
description: rsa pure-Python RSA cryptography implementation
version: "4.0"
tag: "4.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/rsa-4.0.tar.gz
requires:
  - Python
  - setuptools
  - pyasn1
build_requires:
  - bits-recipe-tools
license: Apache-2.0
patches:
  - rsa-4.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################