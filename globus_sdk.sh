package: globus_sdk
description: globus_sdk Python package
version: "3.9.0"
tag: "3.9.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/globus-sdk-3.9.0.tar.gz
requires:
  - requests
  - six
  - PyJWT
  - cryptography
  - typing_extensions
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