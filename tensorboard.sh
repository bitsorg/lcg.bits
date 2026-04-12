package: tensorboard
description: tensorboard Python package
version: "2.20.0"
tag: "2.20.0"
requires:
  - Python
  - setuptools
  - pip
  - wheel
  - mock
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
license: TODO
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################