package: TensorRT
description: NVIDIA TensorRT SDK for high-performance deep learning inference
version: "unknown"
tag: "unknown"
requires:
  - Python
  - setuptools
  - pip
  - wheel
  - flatbuffers
  - typing_extensions
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: LicenseRef-NVIDIA-TensorRT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################