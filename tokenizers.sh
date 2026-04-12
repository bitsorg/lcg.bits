package: tokenizers
description: tokenizers Python package
version: "0.22.1"
tag: "0.22.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/tokenizers-0.22.1.tar.gz
requires:
  - Python
  - setuptools
  - pip
  - huggingface_hub
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