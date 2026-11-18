package: itkwasm_downsample_wasi
description: ITK WASM downsampling WASI build
version: "1.5.0"
tag: "1.5.0"
requires:
  - Python
  - importlib_resources
  - itkwasm
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