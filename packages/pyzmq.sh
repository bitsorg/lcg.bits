package: pyzmq
description: PyZMQ Python bindings for ZeroMQ
version: "27.1.0"
tag: "27.1.0"
requires:
  - Python
  - zeromq
  - cython
  - cffi
  - py
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