package: transformers
description: Hugging Face Transformers state-of-the-art NLP models
version: "4.57.3"
tag: "4.57.3"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
requires:
  - Python
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
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################