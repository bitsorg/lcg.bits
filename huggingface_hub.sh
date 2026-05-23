package: huggingface_hub
description: Hugging Face Hub client library for model/dataset download and sharing
version: "0.35.1"
tag: "0.35.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/%(name)s-%(version)s.tar.gz
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
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
