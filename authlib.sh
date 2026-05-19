package: Authlib
description: Authlib OAuth and OpenID Connect library for Python
version: "0.15.5"
tag: "0.15.5"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Authlib-0.15.5.tar.gz
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
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################