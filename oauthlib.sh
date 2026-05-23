package: oauthlib
description: OAuthlib framework-agnostic OAuth 1 and 2 library
version: "3.2.2"
tag: "3.2.2"
requires:
  - Python
  - cryptography
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################