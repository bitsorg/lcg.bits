package: trio_websocket
description: trio-websocket WebSocket client/server for Trio
version: "0.11.1"
tag: "0.11.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/trio-websocket-0.11.1.tar.gz
requires:
  - Python
  - arrow
  - trio
  - wsproto
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