package: google_auth
description: google-auth Google authentication library for Python
version: "2.38.0"
tag: "2.38.0"
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
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################