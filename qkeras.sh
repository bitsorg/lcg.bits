package: QKeras
description: QKeras quantization-aware training extension for Keras
version: "0.9.0"
tag: "0.9.0"
requires:
  - Python
  - tensorflow_model_optimization
  - tqdm
  - scipy
  - scikitlearn
  - pyparser
  - numpy
  - networkx
  - keras_tuner
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