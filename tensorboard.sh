package: tensorboard
description: TensorBoard TensorFlow visualization toolkit
version: "2.20.0"
tag: "2.20.0"
requires:
  - Python
  - setuptools
  - pip
  - wheel
  - werkzeug
  - markdown
  - six
  - numpy
  - google_auth_oauthlib
  - grpcio
  - absl_py
  - protobuf
  - tensorboard_data_server
  - packaging
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