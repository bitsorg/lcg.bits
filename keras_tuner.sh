package: keras_tuner
description: KerasTuner hyperparameter tuning library for Keras
version: "1.4.7"
tag: "1.4.7"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
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
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################