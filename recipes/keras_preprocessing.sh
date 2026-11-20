package: keras_preprocessing
description: Keras Preprocessing data preprocessing utilities
version: "1.1.2"
tag: "1.1.2"
requires:
  - Python
  - keras
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################