package: google_auth
description: google-auth Google authentication library for Python
version: "2.38.0"
tag: "2.38.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/google-auth-2.38.0.tar.gz
requires:
  - Python
  - cachetools
  - pyasn1_modules
  - rsa
  - six
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################