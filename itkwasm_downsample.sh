package: itkwasm_downsample
description: ITK WASM image downsampling module
version: "1.4.3"
tag: "1.4.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/itkwasm_downsample-1.4.3.tar.gz
requires:
  - Python
  - pip
  - itkwasm
  - itkwasm_downsample_wasi
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