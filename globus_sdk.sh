package: globus_sdk
description: Globus Python SDK for the Globus data management platform
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
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################