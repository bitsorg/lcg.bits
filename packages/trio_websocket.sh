package: trio_websocket
description: trio-websocket WebSocket client/server for Trio
version: "0.11.1"
tag: "0.11.1"
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
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################