package: keras_applications
description: Keras Applications pre-trained model definitions
version: "1.0.8"
tag: "1.0.8"
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