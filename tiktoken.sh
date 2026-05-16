package: tiktoken
description: tiktoken fast BPE tokenizer for OpenAI models
version: "0.12.0"
tag: "0.12.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tiktoken-0.12.0.tar.gz
requires:
  - Python
  - setuptools
  - pip
  - regex
  - requests
  - rust
build_requires:
  - bits-recipe-tools
license: MIT
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--python"
##############################