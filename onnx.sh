package: onnx
description: onnx Python package
version: "1.16.0"
tag: "1.16.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/onnx-1.16.0.tar.gz
requires:
  - Python
  - setuptools
  - absl
  - protobuf
  - typing_extensions
  - numpy
  - pip
  - six
build_requires:
  - bits-recipe-tools
license: TODO
patches:
  - onnx-1.16.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################