package: google_api_core
description: google-api-core Google API client core library
version: "2.10.1"
tag: "2.10.1"
requires:
  - Python
  - google_auth
  - googleapis_common_protos
  - protobuf
  - requests
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################