package: tf2onnx
description: tf2onnx Python package
version: "1.16.1"
tag: "1.16.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tensorflow-onnx-1.16.1.tar.gz
requires:
  - numpy
  - onnx
  - requests
  - six
  - flatbuffers
  - onnxruntime
  - tensorflow
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