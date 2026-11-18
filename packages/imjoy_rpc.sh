package: imjoy_rpc
description: imjoy-rpc remote procedure call for ImJoy plugins
version: "0.5.59"
tag: "0.5.59"
requires:
  - Python
  - shortuuid
  - websockets
  - msgpack
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