package: transformers
description: transformers Python package
version: "4.57.3"
tag: "4.57.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/transformers-4.57.3.tar.gz
requires:
  - Python
  - setuptools
  - pip
  - tokenizers
  - regex
  - huggingface_hub
  - filelock
  - numpy
  - packaging
  - PyYAML
  - requests
  - tqdm
  - torch
  - h5py
  - safetensors
  - scikitlearn
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