package: huggingface_hub
description: Hugging Face Hub client library for model/dataset download and sharing
version: "0.35.1"
tag: "0.35.1"
requires:
  - Python
  - setuptools
  - pip
  - requests
  - filelock
  - tqdm
  - PyYAML
  - packaging
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
