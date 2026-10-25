package: Authlib
description: Authlib OAuth and OpenID Connect library for Python
version: "1.6.12"
tag: "1.6.12"
requires:
  - Python
  - cryptography
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################