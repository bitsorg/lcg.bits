package: websockets
description: websockets library for building WebSocket servers and clients
version: "14.1"
tag: "14.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/websockets-14.1.tar.gz
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################