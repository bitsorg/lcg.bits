package: transformers
description: Hugging Face Transformers state-of-the-art NLP models
version: "4.57.3"
tag: "4.57.3"
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