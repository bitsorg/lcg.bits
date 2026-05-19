package: tomlkit
description: tomlkit style-preserving TOML library for Python
version: "0.11.8"
tag: "0.11.8"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tomlkit-0.11.8.tar.gz
requires:
  - Python
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