package: itkwasm
description: ITK WebAssembly bindings
version: "1.0b185"
tag: "1.0b185"
requires:
  - Python
  - wasmtime
  - numpy
  - typing_extensions
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