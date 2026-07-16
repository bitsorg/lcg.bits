package: spey
description: spey smooth inference for reinterpretation (HEP)
version: "0.2.5"
source: https://github.com/SpeysideHEP/spey
tag: "v%(version)s"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/spey-v0.2.5.tar.gz
requires:
  - Python
  - numpy
  - scipy
  - autograd
  - semantic_version
  - tqdm
  - requests
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: MIT
patches:
  - spey-0.2.5.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################