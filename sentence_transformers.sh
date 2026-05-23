package: sentence_transformers
description: sentence-transformers sentence and text embedding models
version: "5.1.1"
tag: "5.1.1"
requires:
  - Python
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
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################