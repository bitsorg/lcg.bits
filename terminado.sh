package: terminado
description: terminado tornado and gevent WebSocket terminal server
version: "0.18.1"
tag: "0.18.1"
requires:
  - Python
  - tornado
  - ptyprocess
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: BSD-3-Clause
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################