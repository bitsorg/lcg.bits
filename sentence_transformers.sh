package: sentence_transformers
description: sentence-transformers sentence and text embedding models
version: "5.1.1"
tag: "5.1.1"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/sentence-transformers-5.1.1.tar.gz
requires:
  - Python
  - pip
  - torchvision
  - nltk
  - sentencepiece
  - huggingface_hub
  - scikitlearn
  - scipy
  - transformers
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