package: tensorboard_data_server
description: tensorboard_data_server fast data loading for TensorBoard
version: "0.7.2"
tag: "0.7.2"
requires:
  - Python
  - setuptools
  - pip
  - wheel
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