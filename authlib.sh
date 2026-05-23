package: Authlib
description: Authlib OAuth and OpenID Connect library for Python
version: "0.15.5"
tag: "0.15.5"
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