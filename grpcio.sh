package: grpcio
description: grpcio Python package
version: "1.73.0"
tag: "1.73.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/grpcio-1.73.0.tar.gz
requires:
  - Python
  - setuptools
  - six
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - grpcio-1.73.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################