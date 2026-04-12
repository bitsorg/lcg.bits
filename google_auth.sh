package: google_auth
description: google_auth Python package
version: "2.38.0"
tag: "2.38.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/google-auth-2.38.0.tar.gz
requires:
  - Python
  - setuptools
  - cachetools
  - pyasn1_modules
  - rsa
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