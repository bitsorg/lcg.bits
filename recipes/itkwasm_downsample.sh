package: itkwasm_downsample
description: ITK WASM image downsampling module
version: "1.4.3"
tag: "1.4.3"
requires:
  - Python
  - itkwasm
  - itkwasm_downsample_wasi
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