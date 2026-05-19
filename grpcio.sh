package: grpcio
description: grpcio gRPC Python implementation
version: "1.73.0"
tag: "1.73.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/grpcio-1.73.0.tar.gz
requires:
  - Python
  - typing_extensions
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
patches:
  - grpcio-1.73.0.patch
---
#!/bin/bash -e
export CXX="${CXX:-g++}"
if [ "$(uname -s)" = "Darwin" ]; then
  export GRPC_PYTHON_BUILD_SYSTEM_ZLIB=true
  export GRPC_PYTHON_CFLAGS="-fvisibility=hidden -fno-wrapv -fno-exceptions -std=c++17"
else
  export GRPC_PYTHON_CFLAGS="-fvisibility=hidden -fno-wrapv -fno-exceptions"
fi
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################