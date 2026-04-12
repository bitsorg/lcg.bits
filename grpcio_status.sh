package: grpcio_status
description: grpcio_status Python package
version: "1.56.2"
tag: "1.56.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/grpcio-status-1.56.2.tar.gz
requires:
  - Python
  - setuptools
  - pip
  - grpcio
  - googleapis_common_protos
build_requires:
  - bits-recipe-tools
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################