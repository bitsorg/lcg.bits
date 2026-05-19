package: keras_applications
description: Keras Applications pre-trained model definitions
version: "1.0.8"
tag: "1.0.8"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/Keras_Applications-1.0.8.tar.gz
requires:
  - Python
  - keras
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################