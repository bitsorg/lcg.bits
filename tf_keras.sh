package: tf_keras
description: tf-keras official Keras for TensorFlow 2
version: "2.20.1"
tag: "2.20.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tf_keras-2.20.1.tar.gz
requires:
  - Python
  - pip
  - tensorflow
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