package: hls4ml
description: hls4ml Python package
version: "1.2.0"
tag: "1.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/hls4ml-1.2.0.tar.gz
requires:
  - Python
  - pip
  - h5py
  - numpy
  - onnx
  - onnxruntime
  - PyYAML
  - QKeras
  - tabulate
  - tensorflow
  - pydigitalwavetools
  - calmjs_parse
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