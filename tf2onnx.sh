package: tf2onnx
description: tf2onnx convert TensorFlow models to ONNX format
version: "1.16.1"
source: https://github.com/onnx/tensorflow-onnx
tag: "v%(version)s"
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
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################