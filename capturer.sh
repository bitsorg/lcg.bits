package: capturer
description: capturer transparently captures stdout/stderr in Python
version: "3.0"
tag: "3.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/capturer-3.0.tar.gz
requires:
  - Python
  - pip
  - humanfriendly
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