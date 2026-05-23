package: sentencepiece
description: SentencePiece unsupervised text tokenizer
version: "0.2.0"
tag: "0.2.0"
requires:
  - Python
build_requires:
  - bits-recipe-tools
  - "GCC-Toolchain:(?!osx)"
license: Apache-2.0
#patches:
#  - sentencepiece-0.2.0.patch
---
#!/bin/bash -e
##############################
. $(bits-include PythonPipRecipe)
##############################
MODULE_OPTIONS="--bin --python"
##############################
