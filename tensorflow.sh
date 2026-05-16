package: tensorflow
description: TensorFlow open-source machine learning framework (Google)
version: "2.20.0"
tag: "2.20.0"
requires:
  - Python
  - setuptools
  - pip
  - numpy
  - six
  - wheel
  - mock
  - tensorboard
  - absl_py
  - keras_applications
  - keras_preprocessing
  - opt_einsum
  - wrapt
  - google_pasta
  - flatbuffers
  - typing_extensions
  - jax
  - packaging
  # optional:
  # - TensorRT
build_requires:
  - bits-recipe-tools
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################