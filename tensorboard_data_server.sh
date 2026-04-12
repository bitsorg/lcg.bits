package: tensorboard_data_server
description: tensorboard_data_server Python package
version: "0.7.2"
tag: "0.7.2"
requires:
  - Python
  - setuptools
  - pip
  - wheel
  - mock
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