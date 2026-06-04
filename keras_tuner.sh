package: keras_tuner
description: KerasTuner hyperparameter tuning library for Keras
version: "1.4.7"
tag: "1.4.7"
requires:
  - Python
  - packaging
  - numpy
  - requests
  - scipy
  - ipython
  - kt_legacy
  - keras
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