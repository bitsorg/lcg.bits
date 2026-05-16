package: google_api_core
description: google-api-core Google API client core library
version: "2.10.1"
tag: "2.10.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/google-api-core-2.10.1.tar.gz
requires:
  - Python
  - google_auth
  - googleapis_common_protos
  - protobuf
  - requests
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