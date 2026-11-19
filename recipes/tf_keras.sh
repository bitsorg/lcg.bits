package: tf_keras
description: tf-keras official Keras for TensorFlow 2
version: "2.20.1"
tag: "2.20.1"
requires:
  - Python
  - tensorflow
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