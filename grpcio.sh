package: grpcio
description: grpcio gRPC Python implementation
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
license: Apache-2.0
patches:
  - grpcio-1.73.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################