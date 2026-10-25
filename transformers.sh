package: transformers
description: Hugging Face Transformers state-of-the-art NLP models
version: "5.10.0"
tag: "5.10.0"
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
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################