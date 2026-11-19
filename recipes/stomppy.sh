package: stomppy
description: stomp.py STOMP message protocol client for Python
version: "9.0.0"
requires:
  - Python
  - docopt
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
PYPI_NAME="stomp.py"
MODULE_OPTIONS="--bin --python"
##############################
