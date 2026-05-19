package: grpcio_status
description: grpcio-status status proto bindings for gRPC Python
version: "1.56.2"
tag: "1.56.2"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/grpcio-status-1.56.2.tar.gz
requires:
  - Python
  - grpcio
  - googleapis_common_protos
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################