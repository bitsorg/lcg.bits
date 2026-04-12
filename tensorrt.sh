package: TensorRT
description: TensorRT Python package
version: "unknown"
tag: "unknown"
requires:
  - Python
  - setuptools
  - pip
  - wheel
  - flatbuffers
  - typing_extensions
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