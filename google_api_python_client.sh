package: google_api_python_client
description: google-api-python-client Google API client library
version: "1.12.11"
tag: "1.12.11"
requires:
  - Python
  - google_api_core
  - google_auth
  - six
  - uritemplate
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