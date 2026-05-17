package: webargs
description: webargs declarative request parsing and validation library
version: "8.4.0"
tag: "8.4.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/webargs-8.4.0.tar.gz
requires:
  - Python
  - setuptools
  - marshmallow
  - pip
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