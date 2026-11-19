package: grpcio_status
description: grpcio-status status proto bindings for gRPC Python
version: "1.56.2"
tag: "1.56.2"
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
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################