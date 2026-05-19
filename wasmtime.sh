package: wasmtime
description: wasmtime Python bindings for the Wasmtime WebAssembly runtime
version: "40.0.0"
tag: "40.0.0"
requires:
  - Python
  - cffi
  - importlib_resources
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