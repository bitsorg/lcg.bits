package: sentencepiece
description: SentencePiece unsupervised text tokenizer
version: "0.2.0"
tag: "0.2.0"
sources:
  - https://lcgpackages.web.cern.ch/tarFiles/sources/sentencepiece-0.2.0.tar.gz
requires:
  - Python
  - pip
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
patches:
  - sentencepiece-0.2.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################