package: globus_sdk
description: Globus Python SDK for the Globus data management platform
version: "3.9.0"
tag: "3.9.0"
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
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################