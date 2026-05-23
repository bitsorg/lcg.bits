package: hls4ml
description: hls4ml machine learning firmware synthesis for FPGAs
version: "1.2.0"
tag: "1.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
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
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################